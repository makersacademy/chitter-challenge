require 'pg'

class DatabaseConnection

  def self.connect
    if ENV["ENV"] == "test"
      database_name = "chitter_test"
    else
      database_name = "chitter"
    end
    @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
  end

  def self.exec_params(query, params)
    @connection.exec_params(query, params)
  end

end