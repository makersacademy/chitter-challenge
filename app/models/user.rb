require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :second_name, String
  property :username, String, length: 20, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text


  attr_accessor :password_confirmation
  attr_reader :password
  validates_confirmation_of :password

  def password=(password)
    @password = password
      self.password_digest=BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest)== password
      user
    else
      nil
    end
  end

end
