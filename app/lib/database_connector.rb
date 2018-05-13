require 'pg'

class DatabaseConnector

  def self.db_connection
    ENV['ENVIRONMENT'] = 'test' ? @db_name = 'chitter_test' : @db_name = 'chitter'
    PG.connect(dbname: @db_name)
  end
end