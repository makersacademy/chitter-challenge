require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, Text

	def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_confirmation

  # validates_confirmation_of is a DataMapper method
  # provided especially for validating confirmation passwords!
  # The model will not save unless both password
  # and password_confirmation are the same
  # read more about it in the documentation
  # http://datamapper.org/docs/validations.html
  validates_confirmation_of :password

end