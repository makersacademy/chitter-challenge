require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,                 Serial
  property :name,               String
  property :username,           String
  property :email,              String, required: true, unique: true
  property :password_digest,    Text

  validates_format_of :email, as: :email_address

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email:, password:)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
