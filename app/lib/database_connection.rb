require 'pg'

class DatabaseConnection
  PRODUCTION = {
    host: ENV['DATABASE_HOST_NAME'],
    port: ENV['DATABASE_PORT'],
    dbname: ENV['DATABASE_NAME'],
    user: ENV['DATABASE_USER'],
    password: ENV['DATABASE_PASSWORD']
  }

  class << self
    def setup(database)
      if ENV['RACK_ENV'] == 'production'
        self.connection = PG.connect(PRODUCTION)
      else
        self.connection = PG.connect(dbname: database)
      end
    end

    def query(sql_query)
      connection.exec(sql_query)
    end

    private

    attr_accessor :connection
  end
end
