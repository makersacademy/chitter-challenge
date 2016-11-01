require 'dm-postgres-adapter'
require 'data_mapper'
require 'bcrypt'
require_relative 'datamapper_setup'
require_relative 'peep'

class User
  include DataMapper::Resource
  include BCrypt

  def self.login_check(username, password)
    if self.first(username: username).nil?
      @redirect = '/failed-login'
      return nil
    else
      self.password_checker(username, password)
    end
  end

  def self.password_checker(username, password)
    user = self.first(username: username)
    db_password = Password.new(user.password)
    if db_password != password
      @redirect = '/psswrd-error'
      return nil
    else
      @redirect = '/home'
      return username
    end
  end

  def self.redirect
    @redirect
  end

  def self.new_user_create(name, username, email, password)
    @redirect = '/home'
    if !User.first(email: email).nil?
      @redirect = '/re-login'
    elsif !User.first(username: username).nil?
      @redirect = '/re-signup?usedname=' + "#{username}"
    else
      self.create(name: name, username: username, email: email, password: self.password_hash(password))
    end
  end

  def self.password_hash(password)
    Password.create(password)
  end

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password, Text

  has n, :peeps

end
