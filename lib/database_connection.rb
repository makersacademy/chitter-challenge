require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end

  # discovered this when I put a ' in a peep and it caused the insert method to fall over
  def self.escape_string(string_to_clean)
    @connection.escape_string(string_to_clean)
  end

end
