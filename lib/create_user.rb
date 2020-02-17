require 'pg'

class CreateUser

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.new_user(user_name, password)
    connection = CreateUser.connect
    user_id = connection.exec("SELECT id FROM users WHERE user_name= '#{user_name}';")
    # for cases where user is new
    if user_id.values != []
      result = "User account already in use. Please log in or try a new account name"
    else
      connection.exec("INSERT INTO users (user_name, password) VALUES('#{user_name}', '#{password}')")
      result =  "New user #{user_name} has been created"
    end
    result
  end
end
