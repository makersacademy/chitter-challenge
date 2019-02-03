require 'pg'

class Cheet
  def self.all
    connection = PG.connect(dbname: 'chitter')
    cheets = connection.exec("SELECT * FROM cheets;")
    cheets.map { |row| row['cheet'] }
  end
end
