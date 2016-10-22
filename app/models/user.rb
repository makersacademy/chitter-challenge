require "data_mapper"
require "dm-timestamps"
require "bcrypt"

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String, required: true,
           format: :email_address,
           unique: true,
           messages: {
             is_unique: 'Email is already registered'
           }
  property :username, String
  property :name, String
  property :password_digest, Text
  validates_confirmation_of :password,
           :message => 'The two passwords submitted did not match'

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
