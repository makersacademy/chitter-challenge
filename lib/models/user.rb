require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  has n, :peeps

  attr_reader :password
  attr_reader :email

  def password=(password)
    # @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
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
    return user if user && BCrypt::Password.new(user.password_digest) == password
    nil
  end

end
