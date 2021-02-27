require 'pg'

class Details

    attr_reader :id, :email, :password, :name, :username

    def initialize(id:, email:, password:, name:, username:)
        @id = id
        @email = email
        @password = password
        @name = name
        @username = username
    end
    
    def self.all
        if ENV['ENVIRONMENT'] == 'test' 
            connection = PG.connect :dbname => 'chitter_test'
        else 
            connection = PG.connect :dbname => 'chitter'
        end
        result = connection.exec("SELECT * FROM details;")
        result.map do |detail|
        Details.new(id: detail['id'], email: detail['email'], password: detail['password'], name: detail['name'], username: detail['username'])
        end
    end
        
    def self.create(email:, password:, name:, username:)
        if ENV['ENVIRONMENT'] == 'test' 
            connection = PG.connect :dbname => 'chitter_test'
        else 
            connection = PG.connect :dbname => 'chitter'
        end
        result = connection.exec("INSERT INTO details (email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;")
        Details.new(id: result[0]['id'], email: result[0]['email'], password: result[0]['password'], name: result[0]['name'], username: result[0]['username'])
    end    
end