require 'pg'

class Peep

  attr_reader :body, :timestamp, :id

  def initialize(body:, timestamp:, id:)
    @body = body
    @timestamp = timestamp
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC;")
    result.map do |peep|
      Peep.new(body: peep['body'], timestamp: peep['timestamp'], id: peep['id'])
    end
  end

  def self.post(body:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter')
    end
    result = connection.exec("INSERT INTO peeps (body) VALUES ('#{body}') RETURNING body, timestamp, id;")
    Peep.new(id: result[0]['id'], body: result[0]['body'], timestamp: result[0]['timestamp'])
  end
end
