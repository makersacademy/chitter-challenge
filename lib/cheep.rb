require 'pg'

class Cheep

  def self.all
    connection = PG.connect(dbname: 'cheeps')
    result = connection.exec("SELECT * FROM cheeps;")
    result.map { |cheep| cheep['message'] }
  end

end
