require 'pg'

class Chitter
    def self.return_users
        connection = PG.connect(dbname: 'chitter')
        result = connection.exec("SELECT * FROM users;")
        result.map { |user| user['name'] }
    end
end