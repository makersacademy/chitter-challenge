require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_hash, Text

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.create_user_account(email, password)
    @user = User.create(email: email, password: password)
  end
end
