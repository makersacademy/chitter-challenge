require 'pg'

class Chit

  def self.all
    # research self
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM chits')
    result.map { |chit| chit['chit'] }
  end
end
