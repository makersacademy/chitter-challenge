class DatabaseConnection
  def self.setup(database)
    @connection = PG.connect dbname: database
  end

  def self.connect
    @connection
  end

  def self.execute(sql)
    @connection.exec(sql)
  end
end
