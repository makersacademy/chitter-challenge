require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'peeps')
    result = connection.exec("SELECT * FROM peeps_library;")
    result.map { |peep| peep['peeps'] }
  end
end
