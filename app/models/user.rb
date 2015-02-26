require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  # this will store both the password and the salt
  # It's Text and not String because String holds
  # 50 characters by default
  # and it's not enough for the hash and salt
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation


  validates_confirmation_of :password

  # when assigned the password, we don't store it directly
  # instead, we generate a password digest, that looks like this:
  # "$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa"
  # and save it in the database. This digest, provided by bcrypt,
  # has both the password hash and the salt. We save it to the
  # database instead of the plain password for security reasons.

  def password=(password)#this overwrites the datamapper password= method
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
