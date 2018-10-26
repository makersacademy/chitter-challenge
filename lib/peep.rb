require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'peep_manager_2')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }
  end
end
