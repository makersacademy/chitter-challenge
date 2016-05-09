require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password_digest, Text

  attr_reader :password
  validates_presence_of :password_digest

  has n, :peeps

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      ""
    end
  end

end
