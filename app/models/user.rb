require 'bcrypt'

class User

include DataMapper::Resource

# TODO: don't have in database
  attr_accessor :password_confirmation
  attr_accessor :password

  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

# writes to the database -------------
  property :user_id, Serial
  property :username, Text, required: true
  property :email, String, required: true
  property :password_digest, Text
  # property :password, String
  # property :password_confirmation, String

  has n, :peeps, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username,password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password_token
    self.password_token_timestamp = Time.now
    self.password_token = "DMFYOMLYCESXAFPYFRATHPTKLULDPOVIHUIOZIIPSRLCQV"
  end

end

