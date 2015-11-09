require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation

  property :id, Serial
  property :user_name, String, required: true, unique: true
  property :email, String, required: true, format: :email_address, unique: true
  property :password, BCryptHash, required: true

  validates_confirmation_of :password, message: 'Passwords are not identical'

  def self.authenticate(user_name, password)
    user = User.first(user_name: user_name)
    if user && user.password == password
      user
    else
      nil
    end
  end

  has n, :peeps
end
