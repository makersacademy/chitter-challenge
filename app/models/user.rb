require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String, required: true, format: :email_address, unique: true,
    messages: {
      presence: "Email is mandatory",
      format: "Doesn't look like an email address",
      is_unique: "We already have that email"
    }
  property :password_digest, Text

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, :message => 'Password missmatch'

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end
end
