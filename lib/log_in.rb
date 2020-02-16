require 'pg'

class LogIn

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.check_password(user_name, password)
    connection = LogIn.connect
    user_id = connection.exec("SELECT id FROM users WHERE user_name= '#{user_name}';")
    # for cases where user is new
    if user_id.values == []
      connection.exec("INSERT INTO users (user_name, password) VALUES('#{user_name}, '#{password}'')")
    else
      correct_password = connection.exec("SELECT password FROM users WHERE user_name= '#{user_name}'")
      if password == correct_password.getvalue(0, 0)
        result =  "Password correct"
      else 
        result = "Password incorrect"
      end
    end
    result
  end
end