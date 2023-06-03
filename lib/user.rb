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

  def self.sign_in(username, password)
    user = User.find_by(username: username)
    return nil unless user

    stored_password = BCrypt::Password.new(user.password)
    return nil unless stored_password == password

    user
  end
end
  