require 'pg'

class DatabaseConnection

  def self.connect
    if ENV['DATABASE_URL'] != nil
      @connection = PG.connect(ENV['DATABASE_URL'])
      return
    end
  
    if ENV['ENV'] == 'test'
      dbname = 'chitter_test'
    else
      dbname = 'chitter'
    end
    @connection = PG.connect({host: '127.0.0.1', dbname: dbname})

  end 

  def self.exec_params(query, params)
    @connection.exec_params(query, params)
  end 

  def self.exec(query)
    @connection.exec(query)
  end 

end 