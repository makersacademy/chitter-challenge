require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_app')
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peepdeck| peepdeck['peep'] }
  end
end
