require 'bcrypt'

class User
  include DataMapper::Resource
  has n, :peeps, through: Resource, required: false

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique_index: true
  property :email, String, required: true, format: :email_address, unique_index: true
  property :password_digest, Text, required: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


end
