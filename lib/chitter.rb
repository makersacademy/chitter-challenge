require 'pg'

class ChitterManager

  def self.all
    #conditional statement for test database
    #database called chitter_manager
    if  ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_manager_test' )
    else
      connection = PG.connect( dbname: 'chitter_manager' )
    end
    rs = connection.exec("SELECT * FROM peeps;")
    rs.map do |peep|
      peep['peep']
    end
  end

end