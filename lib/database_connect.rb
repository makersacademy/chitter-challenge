require 'pg'

class DatabaseConnection
  attr_reader :connection

  def self.current_connection
    @connection
  end

  def self.query(sql)
    setup unless @connection
    @connection.exec(sql)
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