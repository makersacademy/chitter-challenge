require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,       Serial
  property :name,     String
  property :email,    String, format: :email_address, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_digest, BCryptHash

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(password)
    @password = Password.create(password)
    self.password_digest = @password
  end

  def login(password)
    self.password == password ? self : nil
  end

end
