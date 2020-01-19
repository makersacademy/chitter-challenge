require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')

    result.map { |peep| peep['peep'] }
  end

  def self.add(peep)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end

end