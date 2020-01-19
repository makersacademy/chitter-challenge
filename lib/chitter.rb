require 'pg'

class Chitter
  attr_reader :id, :peep, :dateinserted

  def initialize(id:, peep:, dateinserted:)
    @id = id
    @peep = peep
    @dateinserted = dateinserted
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec('SELECT * FROM chitters ORDER BY dateinserted DESC')
    result.map do |chitter|
      Chitter.new(id: chitter['id'], peep: chitter['peep'], dateinserted: chitter['dateinserted'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("INSERT INTO chitters (peep) VALUES('#{peep}') RETURNING id, peep, dateinserted")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], dateinserted: result[0]['dateinserted'])
  end

end
