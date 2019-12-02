class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    user = connection.exec "INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password;"
    User.new(id: user[0]['id'], name: user[0]['name'], username: user[0]['username'], email: user[0]['email'], password: user[0]['password'])
  end

  def self.last
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    last_user = connection.query("SELECT * FROM users ORDER BY id DESC limit 1")
    User.new(id: last_user[0]['id'], name: last_user[0]['name'], username: last_user[0]['username'], email: last_user[0]['email'], password: last_user[0]['password'])
  end
end
