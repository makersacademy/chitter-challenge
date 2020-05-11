class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.sign_up(name:, username:, email:, password:)
    user = connect_to_database.exec "INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password;"
    User.new(id: user[0]['id'], name: user[0]['name'], username: user[0]['username'], email: user[0]['email'], password: user[0]['password'])
  end

  def self.last
    last_user = connect_to_database.query("SELECT * FROM users ORDER BY id DESC limit 1")
    User.new(id: last_user[0]['id'], name: last_user[0]['name'], username: last_user[0]['username'], email: last_user[0]['email'], password: last_user[0]['password'])
  end

  def self.log_in(username:, password:)
    match = connect_to_database.exec("SELECT * FROM users WHERE username='#{username}';")
    User.new(id: match[0]['id'], name: match[0]['name'], username: match[0]['username'], email: match[0]['email'], password: match[0]['password']) if match.any? && match[0]['password'] == password
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end