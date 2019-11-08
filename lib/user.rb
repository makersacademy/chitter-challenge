require 'pg'

class User
    attr_reader :id, :email

    def initialize(id:, email:)
        @id = id
        @email = email
    end

    def self.create(email, password)
        connection = connect
        connection.exec("INSERT INTO users (email, password) VALUES ($1, crypt($2, gen_salt('bf')));", [email, password])
    end

    def self.find(email, password)
        connection = connect
        result = connection.exec("SELECT * from users WHERE email = $1 AND password = crypt($2, password);", [email, password])
        result.map do |user|
            User.new(id: user['id'], email: user['email'])
        end
    end

    private

    def self.connect
        db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
        return PG.connect(dbname: db_name) 
    end
end