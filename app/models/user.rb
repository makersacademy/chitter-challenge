class User

  include DataMapper::Resource

  attr_reader   :password

  property :id,             Serial
  property :email,          String
  property :password_digest, Text
  property :name,           String
  property :username,       String


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # validates_presence_of :email
  # validates_format_of :email, as: :email_address
  # validates_confirmation_of :password
  # validates_uniqueness_of :email

end
