require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    ENV['RACK_ENV'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(id: peep['id'], message: peep['peep']) }
  end

  def self.post(peep:)
    ENV['RACK_ENV'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec_params("INSERT INTO peeps (peep) VALUES($1) RETURNING id, peep;", [peep])
    Peep.new(id: result[0]['id'], message: result[0]['peep'])
  end

end