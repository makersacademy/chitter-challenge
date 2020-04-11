require 'pg'

class DbConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

end