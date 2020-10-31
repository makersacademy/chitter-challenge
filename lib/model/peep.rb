require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'my_peeps_test')
    else
      connection = PG.connect(dbname: 'my_peeps')
    end
     result = connection.exec('SELECT * FROM peeps;')
     result.map { |cp| cp['peep'] }
  end
end
