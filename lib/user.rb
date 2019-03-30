require './lib/database_connection'

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
      sql = "INSERT INTO users (name, username, email, password) VALUES
      ('#{name}','#{username}','#{email}', '#{password}') RETURNING id, name, username, email, password;"

      result = DatabaseConnection.query(sql).first
  
      User.new(id: result['id'], name: result['name'], username: result['username'], email: result['email'], password: result['password'])
    end

end