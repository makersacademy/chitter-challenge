require 'active_record'
require_relative 'database_connection'
require 'bcrypt'
establish_database_connection

class User < ActiveRecord::Base
  has_many :posts 
  def self.all_records
    @users = []
    User.all.map do |user|
      @users << user
    end
    @users
  end

  def self.create_user(name, username, email, password)
    encrypted_password = BCrypt::Password.create(password)
    user = User.new(name: name, username: username, email: email, password: encrypted_password)
    user.save
    user
  end

  def authenticate(password)
    BCrypt::Password.new(self.password) == password
  end
end