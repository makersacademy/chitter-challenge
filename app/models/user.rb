require 'data_mapper'
require_relative './datamapper_settings'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, unique: true, required: true
  property :password_digest, Text
  property :username, String, unique: true

  validates_presence_of :email, :name, :password_digest, :username
  validates_uniqueness_of :username, :email
  validates_format_of :email, :as => :email_address


  def password=(password)
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

  data_mapper_settings


end
