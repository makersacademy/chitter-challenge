require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username



  property :id, Serial
  property :firstname, Text
  property :surname, Text
  property :username, String, unique: true, message: 'This username already exists'
  property :email, String, unique: true, message: 'This email already exists'
  property :password_digest, Text


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