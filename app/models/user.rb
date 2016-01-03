require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, unique: true, format: :email_address, required: true
  property :password_digest, Text
  property :name, String
  property :username, String, unique: true, required: true

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

  validates_presence_of :email
  validates_format_of :email, as: :email_address
  validates_confirmation_of :password

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
