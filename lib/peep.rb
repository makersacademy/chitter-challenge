require 'pg'

class Peep
  attr_reader :id, :body, :time

    def initialize(id:, body:, time:)
        @id = id
        @body = body
        @time = time
    end

    def self.all
        connection = PG.connect(dbname: 'chitter')
        peep = connection.exec("SELECT * FROM peep ORDER BY id DESC")
        peep.map do |peep| 
            Peep.new(id: peep['id'], body: peep['body'], time: peep['time'])
        end
    end

    def self.add(id:, body:, time:)
        connection = PG.connect(dbname: 'chitter')
        peep = connection.exec("INSERT INTO peep (body, time) VALUES('#{body}', CURRENT_TIMESTAMP) RETURNING id, body, time;")
        Peep.new(id: peep[0]['id'], body: peep[0]['body'], time: peep[0]['time'])
    end
end