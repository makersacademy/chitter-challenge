require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, required: true
  property :handle, String, unique: true
  property :email, String, unique: true, required: true,
  messages: {
      presence: "We need your email address.",
      is_unique: "We already have that email.",
      format: "Doesn't look like an email address to me ..."
    }
  property :password, BCryptHash, required: true

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, required: true

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && Password.new(user.password) == password
  end

end
