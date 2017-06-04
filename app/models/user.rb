require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true, :format => :email_address
  property :password_digest, Text

  validates_presence_of     :password_confirmation
  validates_presence_of     :password
  validates_length_of       :password, :min => 6
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
