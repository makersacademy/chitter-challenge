require 'bcrypt'
require 'pg'

class User
  attr_reader :id, :user_name

  def initialize(id, user_name)
    @id = id
    @user_name = user_name
  end

  def self.add(nom, user, mail, password)
    set_database 
    pwdhash = BCrypt::Password.create("password")
    @con.exec("INSERT INTO users (name, username, email, passwordhash) VALUES ('#{nom}', '#{user}', '#{mail}', '#{pwdhash}')")
  end
  
  def self.set_database
    @con = if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
  
  def self.find_id(email, password)
    set_database
    user = @con.exec("SELECT * FROM users WHERE email = '#{email}'")
    if user.cmd_tuples == 0
      'no such user'
    elsif password != user[0]['passwordhash']
      'incorrect password'
    else user[0]['username']
    end
  end

  def self.session_id(email)
    set_database
    user = @con.exec("SELECT * FROM users WHERE email = '#{email}'")
    user[0]['id']
  end

end
