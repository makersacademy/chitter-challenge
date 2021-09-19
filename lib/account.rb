require_relative 'connection'

class Account
  def self.register(email, password)
    connection = determine_connection
    duplicate = 
      connection.exec ("SELECT * FROM chitter_account WHERE email = '#{email}'")
    puts "duplicate is #{duplicate}"
    raise "Duplicate account" unless duplicate.nil?
    connection.exec ("INSERT INTO chitter_account (email,password) 
      VALUES ('#{email}','#{password}');")

  end

  def self.login(email, password)
    connection = determine_connection
    result = 
      connection.exec("SELECT * FROM chitter_account WHERE email = '#{email}' LIMIT 1;")
    credentials = result.map { |account| account }
    if credentials[0][password] == password
      logged_in = true
    else
      logged_in = false
    end
  end

end
