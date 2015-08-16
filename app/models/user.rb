require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :password_token, Text

  has n, :peeps, through: Resource

  validates_confirmation_of :password
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :name

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    (user && BCrypt::Password.new(user.password_digest)) == password ? user : nil
  end
end
