require 'pg'

class DatabaseConnection
  def self.setup(dbname, pg = PG)
    @connection = pg.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
