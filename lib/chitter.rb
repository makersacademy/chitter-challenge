require 'pg'

class ChitterApp
  
  def self.create(chitter)
    # if ENV['ENVIRONMENT'] == 'test'
    #     connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
    # else
    #     connection = PG.connect(dbname: 'chitter_machine', user: 'postgres', password: 'password')
    # end
    
    p "----do I get here----"

    connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
    connection.exec("INSERT INTO chitter (user_id,chitter_message) VALUES ('54','#{chitter}');")    
  end

  def self.all
    connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
    result = connection.exec('SELECT * FROM chitter')
  end

end
