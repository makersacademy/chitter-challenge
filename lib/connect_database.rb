require 'pg'

class ConnectDatabase
    # attr_reader :connection

    # def initialize
    #   @connection = connection
    # end

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
