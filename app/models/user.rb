require 'data_mapper'
require 'dm-postgres-adapter'

require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :handle, String, unique: true
  property :email, String, format: :email_address, unique: true
  property :password_digest, String, length: 60

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate handle, password
    user = User.first(handle: handle)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

end
