require 'pg'

class Peep
  attr_reader :id, :body

    def initialize(id:, body:)
        @id = id
        @body = body
    end

    def self.all
        connection = PG.connect(dbname: 'chitter')
        peep = connection.exec("SELECT * FROM peep ORDER BY id DESC")
        peep.map do |peep| 
            Peep.new(id: peep['id'], body: peep['body'])
        end
    end

    def self.add(id:, body:)
        connection = PG.connect(dbname: 'chitter')
        peep = connection.exec("INSERT INTO peep (body) VALUES('#{body}') RETURNING id, body;")
        Peep.new(id: peep[0]['id'], body: peep[0]['body'])
    end
end