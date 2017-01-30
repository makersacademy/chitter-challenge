class User

  include DataMapper::Resource

  attr_reader   :password

  property :id,             Serial
  property :email,          String, required: true
  property :password_digest, Text
  property :name,           String
  property :username,       String


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_format_of :email, as: :email_address
  validates_uniqueness_of :email

end
