require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peeps

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text
  property :password_token, Text
  property :name, String, required: true
  property :username, String, required: true

  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  # def self.change_password(password)
  #  user && BCrypt::Password.new(user.password_digest) == password
  # end

end