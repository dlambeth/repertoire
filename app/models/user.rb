class User < ActiveRecord::Base
    has_many :microposts, dependent: :destroy
    #active_relationships - following
    has_many :active_relationships, class_name: "Relationship", 
                                    foreign_key: "follower_id",
                                    dependent: :destroy

    #followed users.  Override followed with "fallowing" so we can write user.following 
    #instead of user.folleweds
    has_many :following, through: :active_relationships, source: :followed

    #passive relationships - the user's followers
    has_many :passive_relationships, class_name: "Relationship", 
                                    foreign_key: "followed_id",
                                    dependent: :destroy
    #for consistency with following, keep the source attr, although it's not technically necessary
    has_many :followers, through: :passive_relationships, source: :follower

    attr_accessor :remember_token, :activation_token, :reset_token
    before_save   :downcase_email
    before_create :create_activation_digest

    validates :name, presence: true,  length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, 
                      uniqueness: { case_sensitive: false }

    has_secure_password
    #validate the password length only if it isn't blank.  Blank pwd are only allowed on 
    #update, has_secure_password will ensure the presence on a password. 
    validates :password, length: {minimum: 6}, allow_blank: true

    # Returns the hash digest of the given string.
    def User.digest(string)
       cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
       BCrypt::Password.create(string, cost: cost)

    end

    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(self.remember_token))
    end

    # Activates an account.
    def activate
      update_attribute(:activated,    true)
      update_attribute(:activated_at, Time.zone.now)
    end

    # Sends activation email.
    def send_activation_email
      UserMailer.account_activation(self).deliver_now
    end

    # Sets the password reset attributes.
    def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_digest,  User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
    end

    # Sends password reset email.
    def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
    end

    #not really a "less than", but rather that the reset was sent more than 2 hours ago, 
    #i.e. at a time that is earlier than 2 hours ago
    def password_reset_expired?
      reset_sent_at < 2.hours.ago
    end

    # Returns true if the given token matches the digest.
    # the syntax is confusing but here's what it's doing?
    # send() allows us to build the name of the attribute using the passed attribute symbol, i.e
    # remember or activation. 
    # BCrypt::Password.new(remember_digest) - creates a new Password object with the 
    # password hash
    # .is_password?(string) takes the given string (remember_token) and produces a hash. 
    # then compares the newly created hash to the one provided by remember_digest. 
    # remember_digest is never decrypted, but rather remember_token is encrypted and then compared
    # to the stored value.
    # example of how to call: user.authenticated?(:remember, remember_token)
    def authenticated?(attribute, token)
      digest = send("#{attribute}_digest")
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

    #Defined a proto-feed.  Will eventually include followed users as well. 
    def feed
      Micropost.where("user_id = ?", id)
    end 

    def follow(other_user)
      active_relationships.create(followed_id: other_user.id)
    end

    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end
    
    def following?(other_user)
      following.include?(other_user)
    end

    private
        # Converts email to all lower-case.
        def downcase_email
          self.email = email.downcase
        end

        # Creates and assigns the activation token and digest.
        def create_activation_digest
          self.activation_token  = User.new_token
          self.activation_digest = User.digest(activation_token)
        end
end
