require 'pg'

class Peep

  attr_reader :peep

  def initialize(peep)
    @peep = peep
  end

  def self.all

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'peep_database_test'
    else
      con = PG.connect :dbname => 'peep_database'
    end

    rs = con.exec "SELECT * FROM peeps"
    rs = rs.map { |row| Peep.new(row['text']) }
    rs.reverse

  end

  def self.create(peep)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'peep_database_test'
    else
      con = PG.connect :dbname => 'peep_database'
    end
    
    result = con.exec_params( "INSERT INTO peeps (text) VALUES ($1) RETURNING text; ", [peep] 
  )
  Peep.new(peep: result[0]['text'])

  end
end