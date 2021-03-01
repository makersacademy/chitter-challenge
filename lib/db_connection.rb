require 'pg'

class DBConnection
  def self.setup(dbname)
    @db = PG.connect(dbname: dbname)
  end

  def self.db
    @db
  end

  def self.query(query)
    @db.exec(query)
  end

end
