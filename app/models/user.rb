require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :first_name,       String, required: true
  property :last_name,        String, required: true
  property :email,            String, required: true, :format => :email_address, unique: true
  property :username,         String, required: true, unique: true
  property :password_digest,  Text

  has n, :peeps
  
  validates_confirmation_of :password
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = User.first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
