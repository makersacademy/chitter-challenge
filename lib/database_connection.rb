require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: 'chitter_test')
  end

  def self.connection
    @connection
  end

  def self.query(sql, params = [])
    @connnection.exec_params(sql, params)
  end
end
