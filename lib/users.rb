require 'pg'

class Users
    def self.create(username:, name:, email:, password:)
        connection = PG.connect(dbname: "chitter_challenge")
        connection.exec("INSERT INTO details (username, name, email, password) VALUES('#{username}', '#{name}', '#{email}', '#{password}'")
    end

    def self.login(username:, password:)
        connection = PG.connect(dbname: "chitter_challenge")
        
        #need to fetch details through database then see if they match with inputted - not sure how to do yet

    end

    def self.list #do the same thing with messages here

    end

end