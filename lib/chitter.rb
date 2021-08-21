require 'pg'

class Chitter
  
  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_manager_test')
    else
      connection = PG.connect( dbname: 'chitter_manager')
    end
    result = connection.exec ( "SELECT peep FROM chitters" )
    result.map { |row| row["peep"] }
  end
end
