require 'pg'

class Peep

  def self.all
    result = DbConnection.query("SELECT * FROM peeps;")
    result.map { |entry| entry['peep'] }
  end

  def self.create(peep:)
    result = DbConnection.query("INSERT INTO peeps (peep) VALUES ('#{peep}');")
  end

end
