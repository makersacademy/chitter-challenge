require 'pg'

class Peep

  def self.posted_peeps
     connection = PG.connect(dbname: 'chitter')

     if ENV['ENVIROMENT'] == 'test'
       connection = PG.connect(dbname: 'chitter_test')
     else
       connection = PG.connect(dbname: 'chitter')
     end

     result = connection.exec("SELECT * FROM peeps")
     result.map do |peep|
       peep["body"]
     end
  end
end
