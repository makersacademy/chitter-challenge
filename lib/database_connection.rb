require 'pg'

class DatabaseConnection 

  def self.setup(database)
    @connection = PG.connection(dbname: "#{database}")
  end 

end 