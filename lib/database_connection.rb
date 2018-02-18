require 'pg'

class DatabaseConnection

  def self.connection
    @connection
  end

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
