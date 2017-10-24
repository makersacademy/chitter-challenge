require 'bcrypt'
# :nodoc:
class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,         Serial
  property :name,       String, required: true,
                        :messages => {
                        :presence => "Please enter your name"
                        }
  property :user_name,  String, required: true, unique: true,
                        :messages => {
                        :presence => "Please enter a username",
                        :is_unique => "Username already taken, please choose another"
                        }
  property :email,      String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
