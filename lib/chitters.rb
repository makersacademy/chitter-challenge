require 'pg'

class Chitters

  attr_reader :ts, :peep
  def initialize(ts:, peep:)
    @ts = ts
    @peep = peep
  end

  def self.addpeep(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}') RETURNING peep, ts ")
    Chitters.new(peep: result[0]['peep'], ts: result[0]['ts'])
    
  end

  def self.view_peeps
    # ["test peep"]

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'test_chitter')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    
    result = connection.exec('SELECT * FROM chitter ORDER BY ts DESC')

    result.map do |peeps|
      Chitters.new(peep: peeps['peep'], ts: peeps['ts'])
    end

  end

end