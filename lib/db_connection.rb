require 'pg'

class DBConnection
  def self.setup(dbname)
    @conn = PG.connect(dbname: dbname)
  end

  def self.connection
    @conn
  end

  def self.query(sql)
    @conn.exec(sql)
  end

end
