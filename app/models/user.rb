require 'bcrypt'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, Text
  property :username, Text, required: true, unique: true
  property :email, Text, required: true, unique: true
  property :password_digest, Text
  property :created_at, DateTime
  property :created_on, Date

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

  def self.authenticate(email, password)
    user = all(email: email)[0]
    return user if user && BCrypt::Password.new(user.password_digest) == password
    nil
  end

  has n, :peeps
end
