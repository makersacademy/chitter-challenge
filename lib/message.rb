require 'pg'

class Message

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    self.connection
    result = connection.exec("SELECT * FROM peeps ORDER BY peep DESC;")
    result.map { |peep| peep['peep']}

  end

  def self.add(peep:)
    self.connection
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep;")
    Message.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  private

  def self.connection
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_peeps_test')
  else
    connection = PG.connect(dbname: 'chitter_peeps')
  end
end

end
