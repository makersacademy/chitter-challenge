require 'pg'

class Chitter
    def self.return_users
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("SELECT * FROM users;")
        result.map { |user| user['name'] }
    end
end