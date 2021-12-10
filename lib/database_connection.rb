require 'pg'

class DatabaseConnection
  def self.setup
    dbname = if ENV['ENVIRONMENT'] == 'test'
                'chitter_test'
             else
               'chitter'
             end
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql, params = [])
    self.setup
    @connection.exec_params(sql, params)
  end
end