require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peepers")
    result.map { |user| user['peep'] }
  end
end
