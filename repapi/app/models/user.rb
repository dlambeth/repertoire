class User < ActiveRecord::Base
  has_many :lists, class_name: "MyList", dependent: :destroy
  has_many :items, dependent: :destroy
  
  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private
 
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
