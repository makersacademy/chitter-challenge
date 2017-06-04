require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email
  validates_presence_of :full_name
  validates_presence_of :user_name
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :full_name, String, required: true
  property :user_name, String, required: true
  property :email, String, required: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
