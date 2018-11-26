require 'pg'

class User
  def self.user_id
    @user_id
  end

  def self.username
    @username
  end
  
  def self.sign_out
    @user_id = 0
    @username = "not signed in"
  end
  
  def self.sign_in(email, password)
    result = sql_query("SELECT user_id, username FROM users WHERE email = '#{email}' AND password = '#{password}';")
    signed_in(result[0]['user_id'], result[0]['username'])
  end
  
  def self.create(username, name, email, password)
    sql_query("INSERT INTO users (username, name, email, password) VALUES('#{username}','#{name}','#{email}','#{password}');")
  end
  
  def self.sign_in_check(email, password)
    result = sql_query("SELECT COUNT(user_id) FROM users WHERE email = '#{email}' AND password = '#{password}';")
    result[0]['count'].to_i == 1 ? true : false
  end

  def self.username_check(username)
    result = sql_query("SELECT COUNT(username) FROM users WHERE username = '#{username}';")
    result[0]['count'].to_i == 0 ? true : false
  end

  def self.email_check(email)
    result = sql_query("SELECT COUNT(email) FROM users WHERE email = '#{email}';")
    result[0]['count'].to_i == 0 ? true : false
  end

  def self.password_check(password, repassword)
    password == repassword ? true : false
  end
  
  private
  
  def self.signed_in(user_id, username)
    @user_id = user_id.to_i
    @username = username
  end

  def self.sql_query(query)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return connection.exec(query)
  end
end