class User
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_users_test')
    else
      connection = PG.connect(dbname: 'chitter_users')
    end
    result = connection.exec('SELECT * FROM users')
    result.map { |user| "name: #{user['name']} handle: #{user['handle']} email: #{user['email']} password: #{user['password']}" }
  end

  def self.create(name:, handle:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_users_test')
    else
      connection = PG.connect(dbname: 'chitter_users')
    end
    connection.exec("INSERT INTO users (name, handle, email, password) VALUES ('#{name}', '#{handle}', '#{email}', '#{password}');")
  end
end
