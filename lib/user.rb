class User

  def self.sign_up(name, email, username, password)
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}')")
  end

  def self.log_in(username, password)
    raise 'Invalid credentials'
  end
end
