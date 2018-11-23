require 'pg'

class DatabaseConnection
  attr_reader :connection

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.query(string)
    @connection.exec(string)
  end

end
