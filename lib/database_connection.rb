class DatabaseConnection
  def self.setup(database_name)
    @conn = PG.connect( dbname: database_name )
  end

  def self.query(sql)
    @conn.exec(sql)
  end
end
