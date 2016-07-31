require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  # has n, :posts, through: Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :password_digest, String, length: 60
  property :firstname, String, required: true
  property :surname, String, required: true
  property :email, String, required: true, format: :email_address, unique: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(my_password)
    @password = my_password
    self.password_digest = BCrypt::Password.create(my_password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
