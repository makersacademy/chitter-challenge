require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Users

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource
  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, String, length: 60
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address



  def password=(password)
    @password =password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
      if user && BCrypt::Password.new(user.password_digest) == password
      else
        nil
      end
  end

end


DataMapper.setup(:default, "postgres://localhost/chitter_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!