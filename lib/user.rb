require 'bcrypt'
class User

  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validates_uniqueness_of :email, :username

  property :id, Serial
  property :email, String, unique: true
  property :username, String, unique: true
  property :name, String
  # property :email, String, unique: true, message: 'This email is already taken'
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # def self.authenticate(email, password)
  #   user = first(email: email)
  #   if user && BCrypt::Password.new(user.password_digest) == password
  #     user
  #   end
  # end

end
