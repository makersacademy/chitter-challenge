require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password_digest, Text

  validates_presence_of :name
  validates_presence_of :user_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :user_name

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = User.first(user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
  
end