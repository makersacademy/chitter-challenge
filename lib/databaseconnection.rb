require "pg"

class Databaseconnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.execute(str)
    @connection.exec(str)
  end
end
