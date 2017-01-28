require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id,                  Serial
  property :email,               String, format: :email_address, required: true, unique: true
  property :password_digest,     Text
  property :name,                String, required: true
  property :username,            String, required: true, unique: true

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

end
