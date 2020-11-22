require 'pg'

class DatabaseConnection
  def self.setup(db)
    @connection = PG.connect(dbname: db)
  end

  class << self
    attr_reader :connection
  end

  def self.query(command)
    @connection.exec(command)
  end
end
