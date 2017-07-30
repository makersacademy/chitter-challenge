require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peep

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text, :required => true

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
