class User
  include DataMapper::Resource

  property :id,                 Serial
  property :email,              String
  property :encrypted_password, String, length: 60
  property :name,               String
  property :username,           String

  def password=(password)
    self.encrypted_password = BCrypt::Password.create(password)
  end
end
