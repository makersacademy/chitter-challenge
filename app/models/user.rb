require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'
require_relative 'peep'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  has n, :peep, through: Resource

  property  :id, Serial
  property  :name, String, required: true
  property  :username, String, required: true, unique: true
  property  :email, String, format: :email_address, required: true, unique: true
  property  :password_digest, String, length: 60, required: true

  validates_confirmation_of :password

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

DataMapper.setup(:default, ENV['DATABASE_URL'] ||= "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
