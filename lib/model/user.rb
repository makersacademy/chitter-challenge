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
  validates_with_method :password, method: :password_requirements_check

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_requirements_check
    return true if @password.nil?
    return false if @password.length < 1
    # other password rules here
    true
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end
end
