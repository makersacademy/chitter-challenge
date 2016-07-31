require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id,       Serial
  property :name,     String, required: true
  property :username, String, required: true, unique: true
  property :email,    String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60

  validates_confirmation_of :password
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password
  validates_format_of :email, as: :email_address

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

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
