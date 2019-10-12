require 'pg'

class DatabaseConnection

  def self.setup(dbname:)
    @db_connection = PG.connect(dbname: dbname)
  end

  def self.instance
    @db_connection
  end

  def self.query(sql)
    @db_connection.exec(sql)
  end

end
