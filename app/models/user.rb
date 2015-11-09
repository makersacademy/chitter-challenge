require 'bcrypt' # make sure 'bcrypt' is in your Gemfile
require 'data_mapper'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, Text
  validates_confirmation_of :password

  def password=(password)
    @password = password
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
  # has n, :peeps, :through => Resource

end
