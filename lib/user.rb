require 'active_record'
require_relative 'database_connection'
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

  def self.create_user(username, email, password)
    user = User.new
    user.username = username
    user.email = email
    user.password = password
    user.save
    user
  end
end

# User.create({ :username => 'Jamie', :email => "jamie@gmail.com", :password => "passwordjamie" })

# p User.all
# user.all_records
