require 'pg'


class User

    attr_reader :id, :username, :email, :password


    def initialize(id, username, email, password)
        @id = id
        @username = username
        @email = email
        @password = password
    end


    def self.read
        result = database.exec("SELECT * FROM users")
        result.map { |user| User.new(user['id'],
                                     user['username'],
                                     user['email'],
                                     user['password']) }
    end


    def self.create(create)
        result = database.exec("INSERT INTO users (username, email, password) 
                                VALUES('#{create[:username]}', '#{create[:email]}', '#{create[:password]}') 
                                RETURNING id, username, email, password")

        User.new( result.first['id'], result.first['username'], result.first['email'], result.first['password'] )
    end


    def self.find(id)
        return nil unless id
        result = database.exec("SELECT * FROM users WHERE id = '#{id}'")
        User.new(result.first['id'], result.first['username'], result.first['email'], result.first['password'])
    end


    private_class_method def self.database
        ENV['ENVIRONMENT'] == 'test'  \
            ? PG.connect(dbname: 'chitter_challenge_test')  \
            : PG.connect(dbname: 'chitter_challenge')
    end
end