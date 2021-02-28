require 'pg'

class Account

def initialize(username:, user_email:, password:)
  @username
  @user_email = user_email
  @password = password
end

def self.create(username:, user_email:, password:)
  connection = PG.connect(dbname: 'Chitter')
  # if connection.exec("SELECT * FROM users WHERE user_email = '#{user_email}';")
  #   return
  # else
  connection.exec("INSERT INTO users(user_email, username, password) VALUES('#{user_email}', '#{username}', '#{password}');")
  # end
end
 # def self.login(user_email: password:)
 #   connection = PG.connect(dbname: 'Chitter')
 #   connection.exec("SELECT * FROM users;")
 #   if connection.exec("SELECT * FROM users WHERE user_email = '#{user_email}';") && connection.exec("SELECT * FROM users WHERE password = '#{password}';")
 #       LOGINSUCCESS = true;
 #     else
 #       LOGINSUCCESS = false;
 #     end
 # end
end
