require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    
    result = connection.exec("SELECT * FROM peeps_library;")
    result.map { |peep| peep['peeps'] }
  end
end
