class User

  attr_reader :name, :username

  def self.create(email:, password:, name:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}') RETURNING name, username")

    User.new(name: result[0]['name'], username: result[0]['username'])
  end

  def initialize(name:, username:)
    @name = name
    @username = username
  end
end
