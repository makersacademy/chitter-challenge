require 'pg'
require_relative 'database_connection'

class ChitterApp
  
  def self.create(user_id,peep)
    # if ENV['ENVIRONMENT'] == 'test'
    #     connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
    # else
    #     connection = PG.connect(dbname: 'chitter_machine', user: 'postgres', password: 'password')
    # end
    connection = DatabaseConnection.setup('chitter_machine_test')
    
    p "----do I get here----"

    #connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
    connection.exec("INSERT INTO chitter (user_id,chitter_message) VALUES ('#{user_id}','#{peep}');")    
  end

  def self.all
    connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
    result = connection.exec('SELECT * FROM chitter')
  end

end
