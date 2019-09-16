require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @con = PG.connect dbname: dbname
  end

  def self.query(sql_query)
    @con.exec(sql_query)
  end
end
