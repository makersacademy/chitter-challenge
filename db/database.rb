require 'PG'

class Database
  attr_reader :connection

  def self.current_connection
    @connection
  end

  def self.query(query)
    setup
    @connection.exec(query)
  end

  private 
  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end
end