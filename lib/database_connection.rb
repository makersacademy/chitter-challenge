require 'pg'

class DatabaseConnection
  def self.setup(db)
    @connection = PG.connect(dbname: db)
  end

  def self.setup_production
    @connection = PG.connect(ENV['DATABASE_URL'])
  end

  class << self
    attr_reader :connection
  end

  def self.query(command)
    @connection.exec(command)
  end
end
