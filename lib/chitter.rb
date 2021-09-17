require 'pg'
require_relative 'database_connection'

class ChitterApp
  
  def self.create(user_id,peep)
    # if ENV['RACK_ENV'] == 'test'
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
    #result = connection.exec('SELECT * FROM chitter')
    #result = connection.exec('SELECT chitter_message, TO_CHAR(chitter.created_at, 'Mon DD,YYYY hh:mm') as created, username FROM chitter INNER JOIN students ON (chitter.user_id = students.user_id);')
    result = connection.exec('SELECT chitter_message, chitter.created_at, username FROM chitter INNER JOIN students ON (chitter.user_id = students.user_id);')

    
    result.values

  end

end
