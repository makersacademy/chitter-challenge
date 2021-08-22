require 'pg'

class Peeps 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
    
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peeps| peeps['peeps'] }
  
  end
end