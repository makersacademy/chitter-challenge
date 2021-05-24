require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @con = PG.connect(dbname: dbname)
  end

  def self.query(sql) 
    @con.exec(sql)
  end
end