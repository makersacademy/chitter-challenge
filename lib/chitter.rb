require 'pg'

class Chitter

  def self.all_peeps
    connection = PG.connect(dbname: 'chitter_manager')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

end
