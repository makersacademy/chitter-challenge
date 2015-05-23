require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  has n, :peeps

  property :id, Serial
  property :email, String, unique: true
  property :name, String
  property :username, String
  property :password_digest, Text
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end