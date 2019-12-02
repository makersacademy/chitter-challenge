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
end
