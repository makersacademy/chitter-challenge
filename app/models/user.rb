require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true, required: true
  property :email, String, format: :email_address, unique: true, required: true
  property :password_digest, String, length: 60

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

end
