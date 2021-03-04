require 'pg'

class DatabaseConnection
  class << self
    def setup(database)

      self.connection = PG.connect(
        host: 'ec2-54-242-43-231.compute-1.amazonaws.com',
        port: '5432',
        dbname: 'd2fudekod14k43',
        user: 'gxhgqxcjdyefqi',
        password: '35c1be836d9ea060b87e618f0a05d1bef3d7de2daa775ba39f8963ee3e0d6590'
      )
      end

    def query(sql_query)
      connection.exec(sql_query)
    end

    private

    attr_accessor :connection
  end
end
