require 'pg'

class DatabaseConnection
  # This method connects to PostgreSQL using the PG gem. We connect to 127.0.0.1

  ################## RENDER connect method
  def self.connect
    # If the environment variable (set by Render)
    # is present, use this to open the connection.
    if ENV['DATABASE_URL'] != nil
      @connection = PG.connect(ENV['DATABASE_URL'])
      return
    end
  
    if ENV['ENV'] == 'test'
      database_name = 'chitter_test'
    else
      database_name = 'chitter_render_db'
    end
    @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
  end




  ################### local connect method - NOT for RENDER
  # def self.connect
  #   if ENV['ENV'] == 'test'
  #     database_name = 'chitter_test'
  #   else
  #     database_name = 'chitter'
  #   end
  #   @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
  # end

  def self.exec_params(query, params)
    if @connection.nil?
      raise 'DatabaseConnection.exec_params: Cannot run a SQL query as the connection to'\
      'the database was never opened. Did you make sure to call first the method '\
      '`DatabaseConnection.connect` in your app.rb file (or in your tests spec_helper.rb)?'
    end
    @connection.exec_params(query, params)
  end
end