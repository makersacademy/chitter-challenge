require "pg"

class Peep
  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_manager_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
   
    result = connection.exec("SELECT * FROM peeps;")
    result.map {|peep| peep['message']}
  end

  def self.create(message:)
    if ENV['ENVIROMENT'] == 'test'
        connection = PG.connect(dbname: 'peeps_manager_test')
      else
        connection = PG.connect(dbname: 'peeps_manager')
      end

      connection.exec("INSERT INTO peeps (message) VALUES ('#{message}');")
  end
end