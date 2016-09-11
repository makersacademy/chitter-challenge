require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"
require "dm-validations"

class User

  include DataMapper::Resource

  property :id,              Serial
  property :name,            String
  property :username,        String, required: true, unique: true
  property :email,           String, required: true, unique: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_presence_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
