require 'pg'

class DatabaseConnection
  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.connection
    @connection
  end

  def self.query(string)
    @connection.exec(string)
  end

end
