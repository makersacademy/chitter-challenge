require 'pg'

class DatabaseConnection
  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.current_connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end