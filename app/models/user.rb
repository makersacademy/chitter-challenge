class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true
  property :email, String, format: :email_address, required: true
  property :password_digest, Text, required: true
  attr_reader :password
  attr_accessor :password_confirmation


  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end
end
