require 'pg'

class Peep
  def self.all
  connection = PG.connect(dbname:'chitter')
  result = connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC;")
  result.map {|peep| peep['body']}
  end
end
