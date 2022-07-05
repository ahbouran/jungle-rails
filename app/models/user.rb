class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :password, length: { minimum: 3}
  validates :password_confirmation, length: { minimum: 3}

  def authenticate_with_credentials (email, password)
    User.where(email: email, password:) ? true : false
  end

  has_secure_password

  
end
