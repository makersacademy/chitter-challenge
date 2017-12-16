require './app/data_mapper_setup.rb'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :name, String, required: true
  property :password_digest, Text

  has n, :messages, through: Resource

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_digest = @password
  end

  def self.authenticate(username_or_email, pass)
    user = User.first(username_or_email)
    user && user.password == pass ? user : nil
  end
end
