
require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peep;')
    peep.map { |chitter| chitter['peep'] }
    end
  end

  def self.create
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')

      connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
    end
end
end
