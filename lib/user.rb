require_relative './database_connection'
require_relative '../database_connection_setup.rb'

class User

  def initialize(user_name:, user_email:, user_password:)
    @name = user_name
    @email = user_email
    @password = user_password
  end

  def self.create(user_name, user_email, user_password)
    DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES ('#{user_name}', '#{user_email}', '#{user_password}')")
  end

end
