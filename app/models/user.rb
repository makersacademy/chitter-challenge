require 'bcrypt'

class User
#
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :email, String, required: true, unique: true
  property :handle, String

  property :password_digest, Text

  	# has n, :peeps, through: Resource


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
#
end
