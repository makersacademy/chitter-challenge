require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, unique: true, message: 'This email is already taken'
  property :password_digest, Text

  has n, :blabbs

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: 'Your
                             passwords do not match'
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      return user
    end
    nil
  end

end
