require 'bcrypt'

# understands how to authenticate itself
class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial,
           required: true
  property :full_name, String,
           required: true
  property :user_name, String,
           required: true,
           unique: true
  property :email, String,
           required: true,
           format: :email_address,
           unique: true
  property :password_digest, String,
           length: 60,
           required: true

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end
end
