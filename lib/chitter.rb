require 'pg'
#rename file
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

  def self.create(peep:, time:)
    if  ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_manager_test' )
    else
      connection = PG.connect( dbname: 'chitter_manager' )
    end
    connection.exec("INSERT INTO peeps (peep, post_time) VALUES('#{peep}', '#{time}') RETURNING peep, post_time")
  end
end

#currently returning an array of strings from database
#- need to return separately with time stamp, name and username