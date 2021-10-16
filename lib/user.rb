class User
  attr_reader :id, :username, :name, :email, :password

  def initialize(id:, username:, name:, email:, password:)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.add(username:, name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params(
      "INSERT INTO users (username, name, email, password) VALUES($1, $2, $3, $4) RETURNING id, username, email, password, name;", [username, name, email, password]
    )
    result.map do |user|
      User.new(id: user['id'], username: user['username'], name: user['name'], email: user['email'], password: user['password'])
    end
  end
end