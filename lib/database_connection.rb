require 'pg'

class DatabaseConnection
  
  def self.setup(dbname)
    ## Sets instance variable to PG::Connection object
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql, params=[])
    ## Shortcut method for executing exec_params on PG::Connection object
    @connection.exec_params(sql, params)
  end

  # Accessor methods
  def self.connection
    @connection
  end
end