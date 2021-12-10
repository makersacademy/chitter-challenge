class DatabaseConnection
  def self.setup
    dbname = if ENV['ENVIRONMENT'] == 'test'
                'chitter_test'
             else
               'chitter'
             end
    @connection = PG.connect(dbname: dbname)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end