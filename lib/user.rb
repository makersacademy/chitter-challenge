class User

  def self.create(name, email, username, password)
    User.choose_database
    @controller.exec (
      %$INSERT INTO users(name, email, username, password) 
      VALUES('#{name}', '#{email}', '#{username}', '#{password}');$
      )
  end

  def self.username
    User.choose_database
    username = @controller.exec ("SELECT username FROM users;")
    username.map { |row| row['username'] }.first
  end

   def self.name
    User.choose_database
     username = @controller.exec ("SELECT name FROM users;")
     username.map { |row| row['name'] }.first
   end

  def self.choose_database
    if ENV['RACK_ENV'] == 'test'
      @controller = PG.connect :dbname => 'chitter_test'
    else
      @controller = PG.connect :dbname => 'chitter'
    end
  end

end
