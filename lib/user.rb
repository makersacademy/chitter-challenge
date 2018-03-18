require 'data_mapper'
require 'bcrypt'
#require 'dm-postgres-adapter'
require_relative '../database_connection_setup.rb'

class User
  include DataMapper::Resource
  include BCrypt

  #has n, :peeps

  attr_reader :id, :email, :password, :name, :username


  property :id,           Serial
  property :email,        String,       format: :email_address, required: true
  property :password,     BCryptHash,   length: 10..255,        required: true
  property :name,         String
  property :username,     String,       required: true

  DataMapper.finalize

  def self.sign_up(email, password, name, username)
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
  end
end
