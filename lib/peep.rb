require 'pg'

class Peep
  def post_peep(peep)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec "SELECT * FROM peeps"
    result.map{ |row| row['Peep'] }
  end
end
