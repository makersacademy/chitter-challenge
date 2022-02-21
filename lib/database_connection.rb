require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end

  def self.escape_string(dirty_string)
    @connection.escape_string(dirty_string)
  end

end
