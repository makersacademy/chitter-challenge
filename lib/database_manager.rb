require 'pg'

class DatabaseManager
  def self.setup(pg = PG)
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    @connection = pg.connect(dbname: db_name)
  end

  def self.connection
    @connection = @connection ||= setup
  end

  def self.query(sql_query = "SELECT * FROM peeps", *params)
    connection.exec_params(sql_query, params)
  end
end
