require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter;")
    result.map {|peep| peep['peep']}
  end
end
