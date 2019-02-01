require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |item| item['peep'] }
  end
end
