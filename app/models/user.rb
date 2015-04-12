require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true, message: ""
  property :first_name, String
  property :last_name, String
  property :email, String, unique: true, message: ""
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message:
                        'Sorry, your passwords do not match'
  validates_uniqueness_of :email, message:
                        'Sorry, that email is already taken'
  validates_uniqueness_of :username, message:
                        'Sorry, that username is already taken'

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      return user
    end
    nil
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end