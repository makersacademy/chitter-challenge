class User

  attr_reader :id, :email, :username, :name, :password

def initialize(id:, email:, username:, name:, password:)
@id = id
@email = email
@username = username
@name = name
@password = password
end


def self.create(email:, password:, username:, name:)
  if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_challenge_test')
      else
        connection = PG.connect(dbname: 'chitter_challenge')
      end
  result = connection.exec("INSERT INTO users(email, password, username, name) VALUES ('#{email}', '#{password}', '#{username}', '#{name}') RETURNING id, email, password, username, name;")
end

def self.find(id)
  return nil unless id
  if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_challenge_test')
      else
        connection = PG.connect(dbname: 'chitter_challenge')
      end
  result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
  User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
end
end
