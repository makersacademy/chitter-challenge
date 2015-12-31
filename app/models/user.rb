class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, format: :email_address, unique: true
  property :password_digest, Text

  attr_reader   :password
  attr_accessor :password_confirmation



  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
