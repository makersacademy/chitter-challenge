require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password, String, required: true
  property :first_name, String # , required: true
  property :last_name, String # , required: true
  property :username, String, required: true, unique: true

  property :password_digest, Text

  has n, :peeps, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, _password)
    User.first(email: email)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end

end
