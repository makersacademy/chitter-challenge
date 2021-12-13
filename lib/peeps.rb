require 'pg'

class Peeps
  attr_reader :peep, :time_of_peep

  def initialize(peep:, time_of_peep:)
    @peep = peep
    @time_of_peep = time_of_peep
  end

  def self.add(peep:, time_of_peep:)
    conn = PG.connect(dbname: 'chitter')
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec_params("INSERT INTO peeps (peep, time_of_peep) VALUES ($1, $2) RETURNING id, peep, time_of_peep;", [peep, time_of_peep])
    Peeps.new(peep: result[0]['peep'], time_of_peep: result[0]['time_of_peep'])
  end

  def self.list
    conn = PG.connect(dbname: 'chitter')
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = conn.exec("SELECT * FROM peeps")
    result.map do |peep|
   p Peeps.new(peep: peep['peep'], time_of_peep: peep['time_of_peep:'])
    end
  end
end
