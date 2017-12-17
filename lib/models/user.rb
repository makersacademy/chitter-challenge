require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './peep.rb'
require 'bcrypt'

# DataMapper.setup(:default,
# ENV['DATABASE_URL'] || "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true,
  messages: {
    presence: "No username",
    is_unique: "Username already taken"
  }
  property :email, String, required: true, unique: true, format: :email_address,
  messages: {
    presence: "No email entered",
    is_unique: "Someone has already used that email",
    format: "Wrong email format"
  }
  property :password_hash, Text

  has n, :peep, :through => Resource

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  # validates_presence_of :password
  validates_length_of :password, :min => 8

end

# DataMapper.finalize
# DataMapper.auto_upgrade!
