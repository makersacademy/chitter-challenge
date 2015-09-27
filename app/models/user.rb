require 'bcrypt'

class User

include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_accessor :password
  attr_accessor :password_token
  attr_accessor :password_token_timestamp

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_length_of :username, min: 8
  validates_length_of :password, min: 8
  validates_format_of :email, as: :email_address

  property :user_id, Serial
  property :username, Text, required: true
  property :email, String, required: true
  property :password_digest, Text

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

