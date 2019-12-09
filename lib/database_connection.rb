require 'pg'

class DatabaseConnection
  attr_reader :connection
  def self.start
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
  end

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
