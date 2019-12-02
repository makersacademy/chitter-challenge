require 'pg'

class Peep
  attr_reader :id, :body

  def initialize(id:, body:)
    @id = id
    @body = body
  end

  def self.create(body:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peep = connection.exec "INSERT INTO peeps (body) VALUES('#{body}') RETURNING id, body;"
    Peep.new(id: peep[0]['id'], body: peep[0]['body'])
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.query("SELECT * FROM peeps")
    peeps.map { |peep| Peep.new(id: peep['id'], body: peep['body'])}.reverse
  end
end
