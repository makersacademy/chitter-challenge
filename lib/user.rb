require 'pg'

class User
  attr_reader :id, :user_name

  def initialize(id, user_name)
    @id = id
    @user_name = user_name
  end

  def self.add(nom, user, mail, pwdhash)
    set_database 
    @con.exec("INSERT INTO users (name, username, email, passwordhash) VALUES ('#{nom}', '#{user}', '#{mail}', '#{pwdhash}')")
  end
  
  def self.set_database
    @con = if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
  
  def self.find_id(email, pwd)
    set_database
    user = @con.exec("SELECT * FROM users WHERE email = '#{email}' AND passwordhash = '#{pwd}'")
    if user == nil
      puts '******** no such user'
    else user[0]['username']
    end
  end

end
