require 'pg'

class DatabaseConnection
  def self.setup(dbname, postgres = PG)
    @connection = postgres.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
