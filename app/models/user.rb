require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String, required: true, unique: true
  property :email,      String, required: true, unique: true
  property :name,       String, required: true
  property :digest,     Text,   required: true

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peeps

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.digest = BCrypt::Password.create(password)
  end
end
