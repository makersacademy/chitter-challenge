class User

  def self.sign_up(name, email, username, password)
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}')")
  end
end
