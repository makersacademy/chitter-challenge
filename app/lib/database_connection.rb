require 'pg'

class DatabaseConnection
  class << self
    def setup(database)
      puts ENV['DATABASE_HOST']
      puts ENV['DATABASE_NAME']
      puts ENV['DATABASE_USER']
      puts ENV['DATABASE_PASSWORD']

           # if ENV['DATABASE_HOST']
      self.connection = PG.connect(
        host: ENV['DATABASE_HOST'],
        port: 5432,
        dbname: ENV['DATABASE_NAME'],
        user: ENV['DATABASE_USER'],
        password: ENV['DATABASE_PASSWORD']
      )
        # else
        #   self.connection = PG.connect(dbname: database)
        # end
      end

      # if production - specify host / port
      # if ENV['DATABASE_HOST']
        # host = ...
        # user = ....
        # ^^
        # %w[host port options tty dbname user password]
        # https://www.rubydoc.info/gems/pg/PG/Connection

    def query(sql_query)
      connection.exec(sql_query)
    end

    private

    attr_accessor :connection
  end
end
