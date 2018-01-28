require 'bcrypt'

p ENV['RACK_ENV']


class Maker

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, Text
  property :user_name, String

  has n, :peeps, through: Resource

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_migrate!
end
