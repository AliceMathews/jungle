class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 5 }
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  before_save :downcase_fields

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  def downcase_fields
    self.email.downcase!
  end

  # helper_method :authenticate_with_credentials
end
