require 'pg'

class ChitterManager

  def self.all
    #link with database
    #conditional statement for test database
    #database called chitter_manager
    connection = PG.connect( dbname: 'chitter_manager' )
    rs = connection.exec("SELECT * FROM peeps;")
    rs.map do |peep|
      peep['peep']
    end

  end

end