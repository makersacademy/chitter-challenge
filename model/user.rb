require 'data_mapper'
require 'dm-postgres-adapter'
require 'BCrypt'

class User

  include DataMapper::Resource

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
    if @user = User.first(username: username)
       BCrypt::Password.new(@user.password_digest) == password
    end
  end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
