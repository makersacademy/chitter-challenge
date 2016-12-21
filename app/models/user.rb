require 'data_mapper'
require 'bcrypt'
require_relative './peep.rb'
class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, unique: true, required: true
  property :password_digest, Text
  property :username, String, unique: true

  has n, :peeps, through: Resource

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
end
