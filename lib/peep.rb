require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    peeps = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    peeps.map { |peep| peep['message'] }
  end
end
