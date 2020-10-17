require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @conn = PG.connect( dbname: "#{dbname}")
  end

  def self.query(query)
    @conn.exec(query)
  end
end
