require 'bcrypt'

class Maker

  include DataMapper::Resource

  has n, :peeps

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text

  def password=(password)
    self.password_digest == BCrypt::Password.create(password)
  end

  validates_uniqueness_of :email,
    :message => 'oops.  this email address is already registered.'
  validates_uniqueness_of :username,
    :message => 'oops.  this username is already taken.'
  validates_format_of :email, as: :email_address,
    :message => 'oops.  please enter a valid email address.'

end
