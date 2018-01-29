require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'
require_relative 'peep.rb'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,              Serial
  property :email,           String, required: true, unique: true
  property :username,        String, required: true, unique: true
  property :password_hash,   Text

  validates_confirmation_of :password
  validates_presence_of     :email
  validates_format_of       :email, as: :email_address
  validates_presence_of     :username

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end

end
