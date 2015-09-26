require 'bcrypt'

class User

include DataMapper::Resource

  attr_accessor :email
  attr_accessor :username
  attr_accessor :password
  attr_accessor :password_confirmation
  attr_accessor :password_token

  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text
  property :password_token, Text
  property :password_token_timestamp, Text


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(email: email)
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

