require 'pg'

class Peep

  if ENV['RACK_ENV'] == 'test'
    @connection = PG.connect(dbname: 'chitter_test')
  else
    @connection = PG.connect(dbname: 'chitter')
  end

  attr_reader :id, :peep, :peeptime

  def initialize(id:, peep:, peeptime:)
    @id = id
    @peep = peep
    @peeptime = peeptime
  end

  def self.all
    result = @connection.exec("SELECT * FROM peeps ORDER BY peeptime DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], peeptime: peep['peeptime'])
    end
  end

  def self.create(peep:)
    result = @connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep, peeptime;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], peeptime: result[0]['peeptime'])
  end

end
