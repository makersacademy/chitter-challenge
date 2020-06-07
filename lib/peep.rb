require 'pg'

class Peep

  attr_reader :id, :peep, :peeped_at, :peeped_by

  def initialize(id:, peep:, peeped_at:, peeped_by:)
    @id = id
    @peep = peep
    @peeped_at = peeped_at
    @peeped_by = peeped_by
  end

  def self.post(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') 
    RETURNING id, peep, peeped_at, peeped_by;")
    
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], peeped_at: 
    result[0]['peeped_at'], peeped_by: result[0]['peeped_by'])
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map {
      |row| Peep.new(id: row['id'], peep: row['peep'], peeped_at: row['peeped_at'], 
      peeped_by: row['peeped_by'])
    }
  end

end
