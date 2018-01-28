class User
  include DataMapper::Resource

  property :id,                 Serial
  property :email,              String
  property :encrypted_password, String, length: 60
  property :name,               String
  property :username,           String

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end
end
