require 'bcrypt'


class User
  
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text
  property :username, String  

  has n, :peeps

  validates_confirmation_of :password

  def password=(password)
    @password = password #aren't we saving the password uncrypted????
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