require 'pg'

class Peep

  def self.all
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("SELECT * FROM chitter_peeps;")
    result.map { |p| p ['peeps'] }
  end
end
