require 'pg'
#require 'activerecord'

class User #< ActiveRecord::BASE

    attr_reader :id, :username, :email
  
    def initialize(id:, username:, email:)
      @id  = id
      @username = username
      @email = email
    end

    def self.create(username:, email:)
        if ENV['ENVIRONMENT'] == 'test'
            @connection = PG.connect(dbname: 'chitter_test')
          else
            @connection = PG.connect(dbname: 'chitter')
          end
        result = @connection.exec("INSERT INTO users (username, email) VALUES('#{username}', '#{email}') RETURNING id, username, email")
        User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
    end

end
