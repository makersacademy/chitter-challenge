require 'pg'

class DatabaseConnection
  attr_reader :connection

  def initialize
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    elsif ENV['ENVIRONMENT'] == 'production'
      @connection = PG.connect(dbname: 'chitter_test')
    elsif ENV['ENVIRONMENT'] == 'development'
      @connection = PG.connect(dbname: 'chitter')
    else
      raise 'No database environment specified'
    end
  end

  def query(sql)
    @connection.exec(sql)
  end
end
