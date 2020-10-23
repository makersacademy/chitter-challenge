require 'pg'

class Peep

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |row|
      {:id => row['id'], :message => row['message']}
    end
  end
  
end
