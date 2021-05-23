require 'pg'

class Peep 
  def self.all
      connection = PG.connect(dbname: 'chitter')
      result = connection.exec('SELECT * FROM chitter_table ORDER BY date DESC')
      result.map { |peep| peep }
  end
end
