require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :full_name, Text
  property :user_name, Text
  property :email, String,
           required: true,
           format: :email_address,
           unique: true
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
