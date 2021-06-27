require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |post| post['peep'] }
  end
end