require 'bcrypt'
# require 'data_mapper'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, required: true, unique: true
  # property :username, String
  # property :email, String
  property :password_digest, Text

  has n, :posts
  #
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end

end
