require 'pg'
require_relative 'database_connection'

class Users
  attr_reader :name
  # makes instances accessible to others 
  # returns the information asked for about the object 

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup(dbname: 'chitter_test')
  else
    DatabaseConnection.setup(dbname: 'chitter')
  end

  def initialize(name)
    @name = name
  end
  
  def self.create(name)
    inject = DatabaseConnection.query("INSERT INTO users (name) VALUES('#{name}') RETURNING id;")
    object = Users.new(name)
  end

end

