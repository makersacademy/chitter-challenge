class DBConnection
  def self.connect(test_db = 'chitter_test', prod_db = 'chitter')
    database = ENV['ENVIRONMENT'] == 'test' ? test_db : prod_db
    @conn = PG.connect(dbname: database)
  end

  def self.disconnect
    @conn.close
  end

  def self.run_query(query)
    begin
      result = @conn.exec(query)
    rescue Exception => e
      disconnect
      raise e
    end

    result
  end
end