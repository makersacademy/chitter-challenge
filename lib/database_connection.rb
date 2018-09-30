require 'pg'

class DatabaseConnection
  attr_reader :connection
  
  def self.setup(dbname)
    @connection = PG.connect(dbname: 'chitter_test')
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
