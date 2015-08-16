require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, Text, required: true
  property :name, Text, required: true
  property :username, Text, required: true
  property :password_digest, Text

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      return user
    else
      nil
    end
  end

end
