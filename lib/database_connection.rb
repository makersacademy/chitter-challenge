require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @con = PG.connect :dbname => dbname
  end

  def self.connection
    @con
  end

  def self.query(query)
    @con.exec(query)
  end
end
