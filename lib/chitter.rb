require 'pg'

class Chitter
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec('SELECT * FROM chitters')
    result.map do |chitter|
      Chitter.new(id: chitter['id'], peep: chitter['peep'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("INSERT INTO chitters (peep) VALUES('#{peep}') RETURNING id, peep")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'])
  end
  
  
end