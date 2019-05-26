class User
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.sign_up(email:, password:, name:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    query = "INSERT INTO users (email, password, name, username)
             VALUES('#{email}', '#{password}', '#{name}', '#{username}')
             RETURNING id, email, password, name, username;"

    user = connection.exec(query).first
    
    User.new(id: user['id'], email: user['email'], password: user['password'],
             name: user['name'], username: user['username'])
  end
end
