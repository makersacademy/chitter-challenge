require 'bcrypt'
class Maker

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password_digest, Text

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
  validates_uniqueness_of :username
  validates_uniqueness_of :email


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)

    maker = first(:username => username)

    if maker && BCrypt::Password.new(maker.password_digest) == password
      maker
    else
      nil
    end
  end
end