class User < ActiveRecord::Base
    #force email to be all lower case so we can 
    #ensure uniqueness w/in the database
    before_save {self.email = email.downcase}

    validates :name, presence: true,  length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }, 
                      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: {minimum: 6}


end
