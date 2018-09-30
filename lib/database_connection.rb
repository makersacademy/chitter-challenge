require 'pg'
require 'uri'

class DatabaseConnection

  def self.setup
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    elsif ENV['RACK_ENV'] == 'production'
      bits = URI.parse(ENV['DATABASE_URL'])
      @connection = PG.connect(bits.hostname, bits.port, nil, nil,
                               bits.path[1..-1], bits.user, bits.password)
    elsif ENV['RACK_ENV'] == 'development'
      @connection = PG.connect(dbname: 'chitter')
    else
      raise 'No database environment specified'
    end
  end

  def self.db
    @connection.db
  end

  def self.query(sql)
    parse_results(@connection.exec(sql))
  end

  def self.parse_results(pg_result)
    pg_result.map { |hash| parse_hash(hash) }
  end

  def self.parse_hash(hash)
    output = Hash.new
    hash.keys.each { |key| output[key.to_sym] = hash[key] }
    output
  end
end
