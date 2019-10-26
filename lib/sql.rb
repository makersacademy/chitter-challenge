require 'pg'
class SQL 
  #inserting new users in to db
  def self.insert_new_user(name:, email:, username:, password:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO users(name, email, username, password) VALUES('#{name}', '#{email}','#{username}','#{password}') RETURNING id, name, email, username, password")
  end

  #inserting new peep to chitter
  def self.insert_new_peep(text:, post_time:, id:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps(text, post_time, id) VALUES('#{text}', '#{post_time}', '#{id}') RETURNING peep_id, text, id, post_time")
  end

  #select all peeps from the db 
  def self.select_all_peeps 
    connection = PG.connect(dbname: 'chitter')
    connection.exec("SELECT username, peeps.text, peeps.post_time FROM peeps, users WHERE peeps.id = users.id ORDER BY post_time DESC")
  end

  #select and check username/password is correct then return true or false
  def self.login(username:, password:) 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT username,password FROM users WHERE username = '#{username}'").to_a
    result.each do | user |
    @output_username = user['username']
    @output_password = user['password']
    end
    if @output_username == username and @output_password == password
      return true
    else 
      return false
    end 
  end

  #select the user id from the users table when given a username
  def self.select_user_id(username:) 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT id FROM users WHERE username = '#{username}'").to_a
    result.each do | user_id |
      return @user_id = user_id['id']
    end
  end
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM users")
    result.map { |main| main['username'] }
  end

end