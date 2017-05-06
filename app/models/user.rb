class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password_digest, Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end
end
