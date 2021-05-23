require 'pg'

class Peep 
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM chitter_table')
    result.map { |bookmark| bookmark['peep'] }
  end
end
