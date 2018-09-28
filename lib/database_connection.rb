require 'pg'

class DatabaseConnection

  def initialize
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    elsif ENV['RACK_ENV'] == 'production'
      @connection = PG.connect(dbname: 'chitter_test')
    elsif ENV['RACK_ENV'] == 'development'
      @connection = PG.connect(dbname: 'chitter')
    else
      raise 'No database environment specified'
    end
  end

  def db
    @connection.db
  end

  def query(sql)
    parse_results(@connection.exec(sql))
  end

  private

  def parse_results(pg_result)
    pg_result.map { |hash| parse_hash(hash) }
  end

  def parse_hash(hash)
    output = Hash.new
    hash.keys.each { |key| output[key.to_sym] = hash[key] }
    output
  end
end
