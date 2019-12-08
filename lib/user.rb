class User

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM users')
    result.map { |user| [user['email'], user['password'], user['username'], user['name']] }
  end

  def self.create(email:, password:, username:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO users (email, password, username, name)\
    VALUES('#{email}', '#{password}', '#{username}', '#{name}')")
  end

end
