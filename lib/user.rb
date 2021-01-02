require 'pg'

class User

    def initialize(id:, name:, email:, username:, password:)
        @id = id
        @name = name
        @email = email
        @username = username
        @password = password
    end

    def self.newuser(id:, name:, email:, username:, password:)
      connection = PG.connect(dbname: 'chitter')
      user = connection.exec("INSERT INTO users (name, email, username, password) VALUES('#{name}', '#{email}', '#{username}','#{password}') RETURNING id, name, email, username, password;")
      User.new(id: user[0]['id'], name: user[0]['name'], email: user[0]['email'], username: user[0]['username'], password: password[0]['password'])
    end

end