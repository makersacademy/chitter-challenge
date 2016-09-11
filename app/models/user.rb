require 'bcrypt'

class User

include DataMapper::Resource

  property :id,              Serial
  property :username,        String, required: true, unique: true
  property :email,           String, required: true, unique: true
  property :password_digest, Text

  attr_reader   :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password,
    :message => "Passwords do not match"
  validates_presence_of :email,
    :message => "No email entered"
  validates_format_of :email, :as => :email_address,
    :message => "Email has an invalid format"
  validates_uniqueness_of :email,
    :message => "Email address already in use"
  validates_presence_of :username,
    :message => "No username entered"
  validates_uniqueness_of :email,
    :message => "Username must be unique"

end
