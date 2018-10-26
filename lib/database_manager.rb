require 'pg'

class DatabaseManager
  class << self
    attr_reader :connection
  end
  
  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(query)
    @connection.exec(query)
  end
end
