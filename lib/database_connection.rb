require 'pg'

class DatabaseConnection
  
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql, params=[])
    @connection.exec_params(sql, params)
  end

  # Accessor methods

  def self.connection
    @connection
  end
end