require 'pg'

class Chit

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chits;")
    result.map { |row| row['chit'] }
  end
end
