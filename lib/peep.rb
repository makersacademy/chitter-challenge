require 'pg' #the gem makes object avaialbe to ruby

class Peep

  attr_reader :id, :peep;

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] = "test"
    connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| 
      Peep.new(id: peep['id'], peep: peep['peep']) 
    }
  end

def self.create(peep:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end

  result = connection.exec_params("INSERT INTO peeps (peep) VALUES($1) RETURNING id, peep", [peep])
  Peep.new(id: result[0]['id'], peep: result[0]['peep'])
end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec_params("DELETE FROM peeps WHERE id = $1", [id])
  end

  def self.update(id:, peep:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  result = connection.exec_params(
    "UPDATE peeps SET peep = $1 WHERE id = $2 RETURNING id, peep;",
    [peep, id]
  )
  Peep.new(id: result[0]['id'], peep: result[0]['peep'])
end

  def self.find(id:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  result = connection.exec_params(
    "SELECT * FROM peeps WHERE id = $1;",
    [id]
  )
  Peep.new(id: result[0]['id'], peep: result[0]['peep'])
end

end