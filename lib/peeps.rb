require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'peep_manager')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peeping| peeping['peep'] }
  end
end
