require 'pg'

class Chit
  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec_params("SELECT * FROM chits")
    result.map { |chit| chit['text'] }
  end
end