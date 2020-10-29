class DatabaseConnection

  def self.setup(db)
    @connection = PG.connect(dbname: db)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
