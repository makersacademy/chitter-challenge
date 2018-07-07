require 'pg'

class DatabaseConnection

  def self.exec(command)
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'blabber_test').exec(command)
    else
      PG.connect(dbname: 'blabber').exec(command)
    end
  end
end
