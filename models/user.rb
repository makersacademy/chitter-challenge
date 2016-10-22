require 'dm-postgres-adapter'
require 'data_mapper'
require_relative 'datamapper_setup'

class User
  include DataMapper::Resource
  #include BCrypt

  def self.username_check(username)
    if self.first(username: username).nil?
      @redirect = '/failed-login'
      return nil
    else
      @redirect = '/home'
      return username
    end
  end

  def self.redirect
    @redirect
  end

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String



  # def encrypt_password(password)
  #     BCrypt::Password.create(password.to_s)
  # end

  # has n, :links, :through => Resource
  # has n, :tags, :through => Resource
end
