require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_manager')
    result = connection.exec("SELECT * FROM peep;")
    result.map { |peep| peep['message'] }
  end
end
