require 'pg'

class DatabaseConnection

  def self.connect(chitter_database)
    @connection = PG.connect({ host: '127.0.0.1', dbname: chitter_database })
  end

  def self.exec_params(query, params)
    if @connection.nil?
      raise 'DatabaseConnection.exec_params: Cannot run a SQL query as the connection to'\
      'the database was never opened. Did you make sure to call first the method '\
      '`DatabaseConnection.connect` in your app.rb file (or in your tests spec_helper.rb)?'
    end
    @connection.exec_params(query, params)
  end
end