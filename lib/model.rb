require 'pg'

class Peep
  def self.add
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter_peeps;")
    result.map { |p| p ['peeps'] }
  end
end
