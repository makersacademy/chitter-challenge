require 'pg'

class DatabaseConnection
  attr_reader :connection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end
end
