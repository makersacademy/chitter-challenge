class User

  def self.add(username)
    ENV['RACK_ENV'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO users (username) VALUES('#{username}')")
  end

  def self.exists?(username)
    ENV['RACK_ENV'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    connection.exec("SELECT * FROM users WHERE username = '#{username}';").any?
  end
end