require 'bcrypt'

class User

  attr_reader :email, :password 
  attr_accessor :password_confirmation

  include DataMapper::Resource 

  property :id, Serial 
  property :email, String, required: true
  property :password_digest, Text

  validates_confirmation_of :password 
  validates_presence_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!