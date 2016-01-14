require 'bcrypt'

class User
  include DataMapper::Resource

  # has n, :chits, through: Resource

  property :id, Serial
  property :full_name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, format: :email_address, unique: true
  property :password_digest, Text, required: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_presence_of :password
  validates_confirmation_of :password

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
end
