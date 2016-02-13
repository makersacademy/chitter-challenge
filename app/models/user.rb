require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,               Serial
  property :name,             String
  property :username,         String
  property :email,            String
  property :password_digest,  Text

  has n, :peeps

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    self.password_match?(user, password) ? user : nil
  end

  private

  def self.password_match?(user, password)
    user && BCrypt::Password.new(user.password_digest) == password
  end
end