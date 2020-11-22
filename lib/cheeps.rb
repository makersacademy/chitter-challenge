require 'pg'

class Cheeps

  def self.all
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("SELECT * FROM cheeps;")
  result.map { |cheep| cheep['text'] }
  end
end
