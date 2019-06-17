class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password_digest, presence: true, length: { minimum: 4 }

 #----- authenticate with credentials --------#
  def self.authenticate_with_credentials(email, password)
    email = email.gsub(' ', '')
    email = email.downcase

    user = User.find_by("lower(email) = ?", email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
