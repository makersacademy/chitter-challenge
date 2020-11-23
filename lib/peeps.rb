require 'pg'

class Peeps 


  def self.feed 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |peeps| peeps['peep'] } 
  end 


  def self.create(peep, username) 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
   
    connection.exec("INSERT INTO peeps (peep,user_name,date_time) VALUES('#{peep}', '#{username}', CURRENT_TIMESTAMP) RETURNING peep, user_name, date_time")
  end

end