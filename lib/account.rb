require 'pg'

class Account
  loginAuth = false

def initialize(username:, user_email:, password:)
  @username
  @user_email = user_email
  @password = password
end

def self.create(username:, user_email:, password:)
  connection = PG.connect(dbname: 'Chitter')
  connection.exec("INSERT INTO users(user_email, username, password) VALUES('#{user_email}', '#{username}', '#{password}');")
end
 # def self.login(username:, password:)
 #   connection = PG.connect(dbname: 'Chitter')
 #   connection.exec("IF EXISTS (SELECT * FROM users WHERE username = '#{username}')")
 #
 #   if connection.exec("SELECT * FROM users WHERE username = '#{username}';") && connection.exec("SELECT * FROM users WHERE password = '#{password}';")
 #       loginAuth = true;
 #     else
 #       loginAuth = false;
 #     end
 # end
end
