require 'pg'
require 'db_connection'

class Peep

  def self.create(peep)    
    DbConnection.query("INSERT INTO peeps(peep, peeper) VALUES('#{peep}', 'none')")
  end

  def self.all
    result = DbConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end

end