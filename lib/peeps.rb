require 'pg'

class Peeps
    attr_reader :id, :name, :username, :message, :time

    def initialize(id:, name:, username:, message:, time:)
        @id = id
        @name = name
        @username = username
        @message = message
        @time = time
    end

    def self.new_peep(name:, username:, message:)
      if ENV['ENVIRONMENT']= 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
        result = connection.exec("INSERT INTO peeps (name, username, message) VALUES('#{name}', '#{username}', '#{message}') RETURNING id, name, username, message, time;")
        p result
    end

    def self.view_peeps
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
      result = connection.exec("SELECT * FROM peeps")
      
      result.map do |peep|
        Peeps.new(id: peep['id'], name: peep['name'], username: peep['username'], message: peep['message'], time: peep['time'])
       end
    end
end