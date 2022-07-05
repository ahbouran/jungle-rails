class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :password, length: { minimum: 3}
  validates :password_confirmation, length: { minimum: 3}

  def self.authenticate_with_credentials (email, password)
    user = User.find_by("lower(email) LIKE lower(?)", email.strip)
    if [user, password, email].any?(nil) 
      nil
    end

    user.authenticate(password) || nil
  end

  
end
