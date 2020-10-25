require 'pg'

class Peep

  def self.all
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

#currently returning an array of strings from database
#- need to return separately with time stamp,name and username