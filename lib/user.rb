#require 'pg'
require_relative 'dbconnect'

class User

  attr_reader :name,
              :handle,
              :password,
              :email

  def initialize(name, handle, password, email)
    @name = name
    @handle = handle
    @password = password
    @email = email
  end

  def self.create(name, handle, password, email)
    stuff = query_to_create(name, handle, password, email)
    result = DBConnect.query(stuff)
    data = ['name', 'handle', 'password', 'email'].map { |item| result[0][item] }
    @user = User.new(*data)
  end

  def self.instance
    @user
  end
  
  # def self.connect_to_db
  #   if ENV['RACK_ENV'] == 'test' 
  #     @connection = PG.connect(dbname: 'chitter_test')
  #   else
  #     @connection = PG.connect(dbname: 'chitter')
  #   end
  # end

  def self.query_to_create(name, handle, password, email)
    "INSERT INTO users (name, handle, password, email) "\
    "VALUES ('#{name}', '#{handle}', '#{password}', '#{email}') "\
    "RETURNING name, handle, password, email;"
  end

end
