class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text, required: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
