require 'pg'

class DBconnection

  def self.setup(dbname)
    @con = PG.connect(dbname: dbname)
  end

  def self.con
    @con
  end

  def self.query(sql)
    @con.exec(sql)
  end

end
