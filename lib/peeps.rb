require 'pg'

class Peeps
  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end

  def self.add(peep:)
    conn = PG.connect(dbname: 'chitter')
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec_params("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep;", [peep])
    Peeps.new(peep: result[0]['peep'])
  end

  def self.list
    conn = PG.connect(dbname: 'chitter')
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    list_of_messages = []
    result = conn.exec("SELECT * FROM peeps")
    result.map do |peep|
      message = Peeps.new(peep: peep['peep'])
      list_of_messages << message.peep
    end
    list_of_messages.sort.reverse
  end
end
