require 'dm-validations'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String
  property :email, String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

  validates_confirmation_of :password

end
#
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.finalize
