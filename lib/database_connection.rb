require 'pg'

class DatabaseConnection
  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(sql_string, params = [])
    @connection.exec_params(sql_string, params)
  end
end