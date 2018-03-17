require_relative './database_connection_setup.rb'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

  def self.create(opt)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message) VALUES('#{opt[:message]}')")
  end
end
