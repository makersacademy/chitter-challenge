require 'pg'

# This class is a thin "wrapper" around the
# PG library. We'll use it in our project to interact
# with the database using SQL.

class DatabaseConnection
  # This method connects to PostgreSQL using the 
  # PG gem. We connect to 127.0.0.1, and select
  # the database name given in argument.
  def self.connect
    # If the environment variable (set by Heroku)
    # is present, use this to open the connection.
    if ENV['chitter_test'] != nil
      @connection = PG.connect(ENV['chitter_test'])
      return
    end
  
    if ENV['ENV'] == 'test'
      database_name = 'chitter_test'
    else
      database_name = 'chitter'
    end
    @connection = PG.connect({ host: 'dpg-cebjvg14reb52uu6j8e0-a', dbname: database_name, password: 1YTMeakP3acyuh09m0p8c6DmLsF8mVvR })
  end

  # This method executes an SQL query 
  # on the database, providing some optional parameters
  # (you will learn a bit later about when to provide these parameters).
  def self.exec_params(query, params)
    if @connection.nil?
      raise 'DatabaseConnection.exec_params: Cannot run a SQL query as the connection to'\
      'the database was never opened. Did you make sure to call first the method '\
      '`DatabaseConnection.connect` in your app.rb file (or in your tests spec_helper.rb)?'
    end
    @connection.exec_params(query, params)
  end
end
