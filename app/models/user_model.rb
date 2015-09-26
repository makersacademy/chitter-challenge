require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial

  property :user_name, String, required: true, unique: true, length: 3..50,
            messages: { is_unique:  "Username is taken",
                        presence:   "Username is required."}

  property :real_name, String, required: true,
            messages: { presence: "Name is required."}

  property :email, String, required: true, unique: true, format: :email_address,
            messages: { is_unique:  "Email address is taken",
                        presence:   "Email is required.",
                        format:     "Please enter a valid email address"}

  property :password_digest, Text

  property :password_token, Text

  validates_length_of :password, min: 1, message: "Password cannot be blank"
  validates_confirmation_of :password, message: "Passwords do not match."

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(user_name: username) || first(email: username)
    return user if user && BCrypt::Password.new(user.password_digest) == password
    nil
  end

end
