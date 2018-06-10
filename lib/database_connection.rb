require 'pg'

class DatabaseConnection

  attr_reader :connection

  def self.setup(database_name)
    @connection = PG.connect(dbname: database_name)
  end

  def self.query(sql)
    @connection.exec(sql)
  end

end
