require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
  property :email, String, required: true,
  unique: true, message: 'This email is already taken'
  property :uname, String, unique: true, message: 'This username is already taken'
  property :password_digest, Text
  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_confirmation_of :password, message: "Sorry, your passwords don't match"

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

# def self.authenticate(email, password)
#   user = first(email: email)
#   if user && BCrypt::Password.new(user.password_digest) == password
#     user
#   end
# end
end
