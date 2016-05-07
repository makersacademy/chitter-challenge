class User
  include DataMapper::Resource

  property :id,              Serial
  property :handle,          String, required: true, unique: true
  property :name,            String, required: true
  property :email,           String, format: :email_address, required: true, unique: true
  property :password_digest, Text, required: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

end