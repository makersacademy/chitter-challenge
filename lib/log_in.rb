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
    p 'user_name is:'
    p user_name
    p 'password is:'
    p password
    user_id = connection.exec("SELECT id FROM users WHERE user_name= '#{user_name}';")
    # for cases where user is new
    p user_id.values
    if user_id.values == []
      connection.exec("INSERT INTO users (user_name, password) VALUES('#{user_name}, '#{password}'')")
      p "New User Created"
      result = "New User Created"
    else
      p "here"
      correct_password = connection.exec("SELECT password FROM users WHERE user_name= '#{user_name}'")
      p "now here"
      p correct_password.getvalue(0,0)
      if password == correct_password.getvalue(0,0)
        p "Password correct"
        result =  "Password correct"
      else 
        p "Password incorrect"
        result = "Password incorrect"
      end
    end
    p "result is: "
    p result
    result
  end
end