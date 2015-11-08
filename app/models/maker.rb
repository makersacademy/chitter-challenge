require 'bcrypt'

class Maker

  include DataMapper::Resource
  include BCrypt

  has n, :peeps, :through => Resource

  property :id, Serial

  property :name, String, required: true,
    messages: { presence: "Name required." }

  property :email, String, required: true, unique: true,
  format: :email_address,
    messages: {
        presence: "Email address required.",
        is_unique: "Email address already taken.",
        format: "Email address entered is not valid."
    }

  property :username, String, required: true, unique: true,
    messages: {
        presence: "Username required.",
        is_unique: "Username already taken."
    }

  property :password_hash, String, required: true,
    messages: { presence: "Password required." }

  property :password_hash_confirmation, String, required: true,
    messages: { presence: "Password confirmation required." }

  validates_confirmation_of :password_hash,
    message: 'Password and confirmation password do not match'

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  def self.authenticate(username, password)
    maker = first(username: username)
    if maker && BCrypt::Password.create(maker.password_hash) == password
      maker
    else
      nil
    end
  end

  attr_reader :password_hash_confirmation
  
end
