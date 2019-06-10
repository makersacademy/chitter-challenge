require 'pg'
require './lib/select_database.rb'

class User
attr_reader :id, :name, :user_name, :email_address
  def initialize(id, name, user_name,email_address)
    @id = id
    @name = name
    @user_name = user_name
    @email_address = email_address
  end

  def self.all
    connection = select_database
    result = connection.exec('SELECT * FROM userdetails;')
    result.map { |user| User.new(user['id'], user['name'], user['user_name'], user['email']) }
  end

  def self.create(id, name, user_name, email_address)
    connection = select_database
    connection.exec("INSERT INTO userdetails (id, name, user_name, email) VALUES('#{id}', '#{name}', '#{user_name}', '#{email_address}');")
  end

end