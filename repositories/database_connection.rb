require 'pg'

# This class is a thin "wrapper" around the
# PG library. We'll use it in our project to interact
# with the database using SQL.

class DatabaseConnection
  def self.connect
    # If the environment variable (set by Render)
    # is present, use this to open the connection.

    if ENV['DATABASE_URL'].nil?
      database_name = 'chitter'
      database_name << '_test' if ENV['ENV'] == 'test'
      database = { host: 'localhost', dbname: database_name }
    else
      database = ENV['DATABASE_URL']
    end

    @connection = PG.connect(database)
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
