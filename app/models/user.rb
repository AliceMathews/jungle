class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 5 }
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def authenticate_with_credentials(email, password)
  end
end
