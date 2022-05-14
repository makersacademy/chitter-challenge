require 'pg'

class Chitter

  def self.all
    # research self
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM chits')
    result.map { |chit| chit['chit'] }
  end
end
