require 'rubygems'
require 'data_mapper'
require 'bcrypt'

class User
  attr_reader :id, :email, :name, :username, :password

  include DataMapper::Resource
  # include DataMapper::Repository
  property :id,         Serial    # An auto-increment integer key
  property :email,      String    # A varchar type string, for short strings
  property :name,       String    # A text block, for longer string data.
  property :username,   String # A DateTime, for any date you might like.
  property :password,   String # A DateTime, for any date you might like.
  # has n, :cheets
  # DataMapper.finalize

  def self.sign_up(email, password, name, username)
    encrypted_password = BCrypt::Password.create(password)
    User.create(
      :email      => email,
      :password   => encrypted_password,
      :name       => name,
      :username   => username
    )
  end

end
