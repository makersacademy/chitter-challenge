require 'bcrypt' # make sure 'bcrypt' is in your Gemfile
require 'dm-validations'

class User
  include DataMapper::Resource

  has n, :peeps


  property :id, Serial
  property :name, String
  property :username, String, :required => true, :unique => true,
    :messages => {
      :presence  => "We need your username.",
      :is_unique => "We already have that username.",
    }

  property :email, String, :required => true, :unique => true,
    :format => :email_address,
    :messages => {
      :presence  => "We need your email address.",
      :is_unique => "We already have that email.",
      :format    => "Doesn't look like an email address to me ..."
    }


  ### FROM WALKTHROUGH
  # this will store both the password and the salt
  # It's Text and not String because String holds
  # only 50 characters by default
  # and it's not enough for the hash and salt
  property :password_digest, Text

  # when assigned the password, we don't store it directly
  # instead, we generate a password digest, that looks like this:
  # "$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa"
  # and save it in the database. This digest, provided by bcrypt,
  # has both the password hash and the salt. We save it to the
  # database instead of the plain password for security reasons.
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  attr_reader :password
  attr_accessor :password_confirmation

  # validates_confirmation_of is a DataMapper method
  # provided especially for validating confirmation passwords!
  # The model will not save unless both password
  # and password_confirmation are the same
  # read more about it in the documentation
  # http://datamapper.org/docs/validations.html
  validates_confirmation_of :password,
    :message => 'Password and confirmation password do not match'

  def self.authenticate(email, password)
    user = first(email: email)
    # if this user exists and the password provided matches
    # the one we have password_digest for, everything's fine
    #
    # The Password.new returns an object that has a different implementation of the equality(`==`)
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
