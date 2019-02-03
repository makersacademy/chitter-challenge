class User

  def initialize

  end

  def self.register(name, username, email, password)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO users (name, username, email, password) VALUES ('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, username, name")
  end
end
