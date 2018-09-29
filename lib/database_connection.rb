require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname) #I think this is just for the tests so we can check what name it is
  end

  def self.connection
    @connection #Just for tests I think
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
