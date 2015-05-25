# User model - holds link to persistence
require 'bcrypt'

class User

  include DataMapper::Resource

  has n, :peeps

  property :id, Serial
  property :handle, String, unique: true, message: 'This handle is taken'
  property :email, String, unique: true, message: 'This email is already taken'
  # this will store both the password and the salt
  # It's Text and not String because String holds
  # 50 characters by default
  # and it's not enough for the hash and salt
  property :password_digest, Text
  # when assigned the password, we don't store it directly
  # instead, we generate a password digest, that looks like this:
  # "$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa"
  # and save it in the database. This digest, provided by bcrypt,
  # has both the password hash and the salt. We save it to the
  # database instead of the plain password for security reasons.

  attr_reader :password
  attr_accessor :password_confirmation

  # this is datamapper's method of validating the model.
  # The model will not be saved unless both password
  # and password_confirmation are the same
  # read more about it in the documentation
  # http://datamapper.org/docs/validations.html
  # validates_uniqueness_of :email # In datamapper's case, creating
  # a unique index automatically implies the necessity of the validation,
  # so this code would be unnecessary. When using other ORMs, double check
  # if creating a unique index implies a model-level validation.
  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    # that's the user who is trying to sign in
    user = first(email: email)
  # if this user exists and the password provided matches
  # the one we have password_digest for, everything's fine

# POTENTIAL PLACE FOR REPLACEMENT PW STUFF?:
            # user = User.first(email: email)
            # # avoid having to memorise ascii codes
            # user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
            # user.password_token_timestamp = Time.now
            # user.save


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
    else
      nil
    end
  end

end
