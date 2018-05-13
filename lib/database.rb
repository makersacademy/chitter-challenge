require 'pg'

class Database
  def self.setup(dbname, pg = PG)
    @con = pg.connect(dbname: dbname)
  end

  def self.query(sql)
    @con.exec(sql)
  end

  def self.con
    @con
  end
end
