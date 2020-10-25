require 'pg'

class DatabaseConnection

  if ENV['RACK_ENV'] == 'test'
    @connection = PG.connect(dbname: 'chitter_manager_test')
  else
    @connection = PG.connect(dbname: 'chitter_manager')
  end

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end