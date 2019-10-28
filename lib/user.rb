require 'pg'

class User
  def self.create(name:, username:, email:, password:)
    connection = PG.connect(dbname: 'chitter_app')
    connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}')")
  end

  def self.log_in(username:, password:)
    connection = PG.connect(dbname: 'chitter_app')
    users = connection.exec("SELECT username, password FROM users WHERE username = '#{username}';").to_a
    users.each do |user|
      if user["password"] == password
        return true
      else
        return false
      end
    end
    return false
  end

  def self.get_user_id(username:)
    connection = PG.connect(dbname: 'chitter_app')
    users = connection.exec("SELECT user_id, username FROM users WHERE username = '#{username}';").to_a
    users.each do |user|
      return user["user_id"].to_i
    end
  end
end
