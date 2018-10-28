require 'pg'
require 'pry'

class User

  def self.unique?(username, email)
    User.registered_users.each do |user|
     return false if user['username'] == username
     return false if user['email']== email
    end
   true
  end

  def self.sign_up(first_name:, last_name:, email:, password:, username:)
    con = connect_to_database
    con.exec("INSERT INTO users (first_name, last_name, email, password, username)
      VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}', '#{username}')")
    current_user(first_name, username)
  end

  def self.first_name
    @name
  end

  def self.username
    @username
  end

  private

  def self.registered_users
    con = connect_to_database
    result= con.exec("SELECT * FROM users")
  end

  def self.current_user(first_name, username)
    @name = first_name
    @username = username
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
