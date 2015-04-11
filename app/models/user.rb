require 'bcrypt'
require 'dm-validations'
class User
  attr_reader :password
  attr_accessor :password_confirmation
  include DataMapper::Resource
  property :id, Serial
  property :email, String, unique: true, format: :email_address
  property :username, String, unique: true
  property :password_digest, BCryptHash
  has n, :cheeps, through: Resource
  property :applauses, Object, default: []
  validates_confirmation_of :password,
                            message: "Those passwords don't match"
  validates_length_of :password_confirmation, min: 6
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  def self.authenticate(username, password)
    user = self.first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
