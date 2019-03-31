require 'pg'

class DBManager
  def self.setup(dbname)
    @db = PG.connect(dbname: dbname)
  end

  def self.instance
    @db
  end

  def self.query(sql)
    @db.exec(sql)
  end
end
