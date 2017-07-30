require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, unique: true, format: :email_address, required: true
  property :password_digest, Text, required: true
  property :username, String, unique: true, required: true
  property :name, String, required: true

  has n, :peeps, through: Resource

  def password=(password)
    return if password.length.zero?
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.authenticate(username_or_email, password)
    current_user = first(email: username_or_email) || User.first(username: username_or_email)
    return nil unless current_user && Password.new(current_user.password_digest) == password
    current_user
  end

  validates_confirmation_of :password

end
