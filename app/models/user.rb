require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :handle,
            String,
            required: true, 
            unique: true, 
            messages: {
              is_unique: "An account with this handle already exists."
}
  property :email,
            String, 
            required: true, 
            unique: true, 
            format: :email_address,
            messages: {
              is_unique: "An account with this email already exists.",
              format: "Please enter a valid email address"
}
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end