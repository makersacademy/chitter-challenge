require 'pg'

class DatabaseConnection

  def self.connect(database_name)
    if ENV['DATABASE_URL'] != nil
      @connection = PG.connect(ENV['DATABASE_URL'])
      return
    end
 
    @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
  end

  def self.exec_params(query, params)
    @connection.exec_params(query, params)
  end

end



    # if ENV["ENV"] == "test"
    #   database_name = "chitter_test"
    # else
    #   database_name = "chitter"
    # end