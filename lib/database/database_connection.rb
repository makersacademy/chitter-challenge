require 'pg'

class DatabaseConnection
  def self.setup(database)
      @con = PG.connect :dbname => database
  end

  def self.connection
    @con
  end

  def self.query(sql)
    begin
      rs = @con.exec sql
    rescue PG::Error => e
      puts e.message
      false
    end
  end
end
