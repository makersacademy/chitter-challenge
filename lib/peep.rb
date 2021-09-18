require 'pg'

class Peep 

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps ORDER BY create_time DESC;')
    result.map { |peep| peep['body'] }
  end
end