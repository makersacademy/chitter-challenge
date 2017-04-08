require 'bcrypt'

class Maker

  include DataMapper::Resource

  has n, :peeps
  has n, :comments

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authentic?(username, password)
    maker = first(username: username)
    maker && BCrypt::Password.new(maker.password_digest) == password
  end

  validates_uniqueness_of :email,
    :message => 'oops.  this email address is already registered.'
  validates_uniqueness_of :username,
    :message => 'oops.  this username is already taken.'
  validates_format_of :email, as: :email_address,
    :message => 'oops.  please enter a valid email address.'
  validates_presence_of :username,
    :message => 'oops.  please enter a username.'
  validates_presence_of :email,
    :message => 'oops.  please enter a username.'

end
