require 'pg'
require_relative 'chitter'

class User
    
    def self.create(email:, password:, name:, username:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}') RETURNING userid, email, name, username;")
        User.new(userid: result[0]['userid'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username']) 
    end

    def self.find(userid)
        return nil unless userid 
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("SELECT * FROM users WHERE userid = '#{userid}'")
        User.new(userid: result[0]['userid'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
    end

    attr_reader :userid, :email, :name, :username

    def initialize(userid:, email:, name:, username:)
        @userid = userid 
        @email = email
        @name = name
        @username = username
    end

    def post(peep, userid)
        Chitter.post_peep(peep: peep, userid: userid)
    end

end
