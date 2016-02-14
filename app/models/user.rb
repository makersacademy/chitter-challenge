require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id,               Serial
  property :name,             String
  property :email,            String, required: true, unique: true
  property :username,         String, required: true, unique: true
  property :password_digest,  Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password
  validates_presence_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
