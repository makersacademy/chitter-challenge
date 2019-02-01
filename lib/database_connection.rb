class DatabaseConnection

  def self.connect(databasename, pg = PG)
    @database = pg.connect(dbname: databasename)
  end

  def self.database
    @database
  end

  def self.query(sql)
    @database.exec(sql)
  end
end
