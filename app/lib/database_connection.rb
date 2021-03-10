require 'pg'

class DatabaseConnection
  PRODUCTION = {
    host: 'ec2-54-242-43-231.compute-1.amazonaws.com',
    port: '5432',
    dbname: 'd2fudekod14k43',
    user: 'gxhgqxcjdyefqi',
    password: '35c1be836d9ea060b87e618f0a05d1bef3d7de2daa775ba39f8963ee3e0d6590'
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
