require './lib/database_connect'

class User 
  def self.add(name:,username:, email:, password:)
    DatabaseConnection.query("INSERT INTO users (name,username,email,password) 
                      VALUES ('#{name}','#{username}','#{email}','#{password}')")
  end 
end 