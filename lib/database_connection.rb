require 'pg'

# This class is a thin "wrapper" around the
# PG library. We'll use it in our project to interact
# with the database using SQL.

class DatabaseConnection

def self.connect
  # If the environment variable (set by Heroku)
  # is present, use this to open the connection.
  if ENV['DATABASE_URL'] != nil
    @connection = PG.connect(ENV['DATABASE_URL'])
    return
  end

  if ENV['ENV'] == 'test'
    database_name = 'chitter_test'
  else
    database_name = 'chitter'
  end
  @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
end
end