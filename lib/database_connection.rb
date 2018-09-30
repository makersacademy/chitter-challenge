require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.exec(instruction)
    @connection.exec(instruction)
  end
end
