class DBWrapper

  def self.connect_to_db

      user = 'postgres'
      password = '123'
  
      if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test', :user => user, :password => password )
      else
      PG.connect(dbname: 'chitter', :user => user, :password => password )
      end
  
  end
  
  def self.database_send(input)
      connect_to_db.exec(input)
  end

end