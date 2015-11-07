require 'bcrypt'

class Maker
  include DataMapper::Resource
  include BCrypt

  property :id, Serial

  property :name, String, required: true,
    messages: { presence: "Name required." }

  property :email, String, unique: true,
  format: :email_address,
    messages: {
        presence: "Email address required.",
        is_unique: "Email address already taken.",
        format: "Email address entered is not valid."
    }

  property :username, String, unique: true,
    messages: {
        presence: "Username required.",
        is_unique: "Username already taken."
    }
    
  property :password_hash, String

  property :password_hash_confirmation, String

  # has n, :peeps, :through => Resource

  # validates_confirmation_of :password_hash
  #
  # def password=(new_password)
  #   @password = new_password
  #   self.password_hash = Password.create(new_password)
  # end
  #
  # attr_reader :password_hash_confirmation

end
