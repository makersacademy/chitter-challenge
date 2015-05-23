require 'bcrypt'

class User

  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :username,   String,  required: true, unique: true
  property :email,      String,  required: true, unique: true
  property :password_digest,   Text,  required: true

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) unless password.empty?
  end

  def self.authenticate(username, password)
    # that's the user who is trying to sign in
    user = first(username: username)
    # if this user exists and the password provided matches
    # the one we have password_digest for, everything's fine
    #
    # The Password.new returns an object that overrides the ==
    # method. Instead of comparing two passwords directly
    # (which is impossible because we only have a one-way hash)
    # the == method calculates the candidate password_digest from
    # the password given and compares it to the password_digest
    # it was initialised with.
    # So, to recap: THIS IS NOT A STRING COMPARISON
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    end
  end

end
