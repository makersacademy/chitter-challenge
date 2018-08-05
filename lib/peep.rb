require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end
    
    result = connection.exec("SELECT * FROM peepers")
    result.map { |user| user['peep'] }
  end
end
