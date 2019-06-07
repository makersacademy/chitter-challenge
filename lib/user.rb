require './lib/database_connect'

class User 
  def self.add(name:,username:, email:, password:)
    DatabaseConnection.query("INSERT INTO users (name,username,email,password) 
                      VALUES ('#{name}','#{username}','#{email}','#{password}')")
  end 

  def self.unique_username?(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'").map { |row| row }
    if result.empty? 
      true
    else
      false
    end
  end 

  def self.unique_email?(email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'").map { |row| row }
    if result.empty? 
      true
    else
      false
    end
  end 

  def self.authenticated?(username,password)
    result =  DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}'").map { |row| row }
    if result.empty?
      false
    else 
      true 
    end
  end 

  def self.id(username)
    result =  DatabaseConnection.query("SELECT id FROM users WHERE username = '#{username}'").map { |row| row }
    result.first['id']
  end 
end 