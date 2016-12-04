require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :handle, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_again

  validates_confirmation_of :password, confirm:
  :password_again

  @@count = 0

  def initialize(params)
    self.password = params[:password]
    self.email = params[:email]
    self.handle = params[:handle]
    self.password_again = params[:password_again]
    self.save
    @@count += 1
  end

  def count
    @@count
  end
end
