class DatabaseConnection
  def self.setup(database)
    @connection = PG.connect dbname: database
  end

  def self.query(query)
    @connection.exec query
  end

  def self.stop
    @connection.close
  end
end
