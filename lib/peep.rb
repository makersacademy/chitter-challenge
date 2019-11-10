require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    results = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    results.map { |peep| peep['peep'] }
  end

end
