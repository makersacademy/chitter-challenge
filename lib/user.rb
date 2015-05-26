# move this to under models

require 'bcrypt' # bcrypt will generate the password hash

class User

  include DataMapper::Resource

  property :id, Serial
  property :fullname, String
  property :username, String, unique: true, message: 'This username is already taken'
  property :email, String, unique: true, message: 'This email is already taken'
  property :password_digest, Text

  validates_confirmation_of :password, :message => "Sorry, your passwords do not match"

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)  # that's the user who is trying to sign in
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end

end