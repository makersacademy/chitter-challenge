require './app/datamapper_setup.rb'
require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :peep, through: Resource

  attr_accessor :password_confirmation
  attr_reader :password, :email, :username, :name

  property :id,       Serial
  property :name,     String
  property :username, String,  required: true, unique: true
  property :email,    String,  required: true, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  validates_presence_of :username
  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
