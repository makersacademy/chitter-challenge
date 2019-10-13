require 'pg'

class DBConnection

  def self.setup(dbname)
    @db = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @db.exec(sql)
  end

end
