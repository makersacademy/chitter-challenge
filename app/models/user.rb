require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :name, String
  property :username, String, unique: true
  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text

  has n, :peeps, through: Resource
  has n, :replys, through: Resource

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
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
