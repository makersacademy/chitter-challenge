require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String
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

  def name=(name)
    names = name.split
    self.first_name = names.first
    self.last_name = names.last if names.count > 1
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end