require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource
  
  attr_reader :password
  validates_format_of :emails, as: :email_address
  

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, Text, required: true
  property :name, String, required: true
  property :username, String, required: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email:email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
DataMapper.setup(:default, "postgres://localhost/chitter_#{RACK_ENV}")
DataMapper.finalize
DataMapper.auto_upgrade!
