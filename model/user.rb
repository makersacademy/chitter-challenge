require 'data_mapper'
require 'dm-postgres-adapter'
require 'BCrypt'
require_relative 'post'

class User

  include DataMapper::Resource

  has n, :posts

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.validate(username, password)
    @user = User.first(username: username)
    @user ? (BCrypt::Password.new(@user.password_digest) == password) : false
  end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
