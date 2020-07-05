class DBWrapper

  def self.connect_to_db

      user = 'postgres'
      password = '123'
  
      if ENV['RACK_ENV'] == 'test'
        PG.connect(dbname: 'chitter_test', :user => user, :password => password )
      else
        PG.connect(dbname: 'chitter', :user => user, :password => password )
      end
  
  end
  
  def self.database_send(input)
      connect_to_db.exec(input)
  end

  def self.setup_test_database
    connect_to_db.exec("TRUNCATE peeps;")
    connect_to_db.exec("INSERT INTO peeps (message) VALUES ('TEST DATA');")
  end

end