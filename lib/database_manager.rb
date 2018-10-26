require 'pg'

class DatabaseManager
  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  class << self
    attr_reader :connection
  end

  def self.query(query)
    @connection.exec(query)
  end
end
