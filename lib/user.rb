class User
  attr_reader :username, :password

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.create(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO users (username, password) VALUES('#{username}', '#{password}')")
    
    result = connection.exec("SELECT * FROM users")
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'])
  end
end
