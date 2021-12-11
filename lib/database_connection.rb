
class DatabaseConnection

  def self.setup(dbname: )
    @conn = PG.connect(dbname: dbname)
  end

  def self.connect
    @conn 
  end

  def self.query(sql, args = [])
    @conn.exec_params(sql, args)
  end
end