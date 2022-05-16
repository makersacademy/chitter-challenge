require 'pg'

class Peep

  attr_reader :peep, :date

  def initialize(peep, date)
    @peep = peep
    @date = date
  end

  def self.all

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'peep_database_test'
    else
      con = PG.connect :dbname => 'peep_database'
    end

    rs = con.exec "SELECT * FROM peeps"
    rs = rs.map { |row| Peep.new(row['text'], row['date']) }
    rs.reverse

  end

  def self.create(peep, date)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'peep_database_test'
    else
      con = PG.connect :dbname => 'peep_database'
    end
    
    result = con.exec_params( "INSERT INTO peeps (text, date) VALUES ($1, $2) RETURNING text, date; ", [peep, date] 
  )
  Peep.new(result[0]['text'], result[0]['date'])

  end
end