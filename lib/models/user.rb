require 'bcrypt'

class User
  attr_reader :password
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :username, String, required: true
  property :password_digest, Text

  validates_presence_of :email
  validates_uniqueness_of :email

  def password=(password)

    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


  def self.authenticate_user(username, password)

    user = User.first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
