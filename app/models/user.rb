class User < ActiveRecord::Base
    attr_accessor :remember_token

    #force email to be all lower case so we can 
    #ensure uniqueness w/in the database
    before_save {self.email = email.downcase}

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

    # Returns true if the given token matches the digest.
    # the syntax is confusing but here's what it's doing? 
    # BCrypt::Password.new(remember_digest) - creates a new Password object with the 
    # password hash
    # .is_password?(string) takes the given string (remember_token) and produces a hash. 
    # then compares the newly created hash to the one provided by remember_digest. 
    # remember_digest is never decrypted, but rather remember_token is encrypted and then compared
    # to the stored value.
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end
end
