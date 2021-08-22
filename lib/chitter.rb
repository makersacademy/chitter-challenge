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

  def self.time
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_manager_test')
    else
      connection = PG.connect( dbname: 'chitter_manager')
    end
    time = connection.exec ( "SELECT created_on FROM chitters" )
    time.map { |row| row["created_on"] }
  end

  # def self.post(post:)
  #   if ENV['ENVIROMENT'] == 'test'
  #     connection = PG.connect( dbname: 'chitter_manager_test')
  #   else
  #     connection = PG.connect( dbname: 'chitter_manager')
  #   end
  #   connection.exec("INSERT INTO chitters (peep) VALUES ('#{peep}')")

  # end

end
