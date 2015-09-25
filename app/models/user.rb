require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password_digest, Text
  has n, :peeps, through: Resource

  validates_presence_of :name
  validates_presence_of :user_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :user_name

  def password=(password)
    #byebug
    #self.password_digest = BCrypt::Password.create(password)
    digest = BCrypt::Password.create(password)
    self.password_digest = BCrypt::Password.new(digest)
  end

  def self.authenticate(user_name, password)
    #byebug
    user = User.first(user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
    #if user && password == user.password
      user
    else
      nil
    end
  end

end