require 'PG'

class Database

  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.query(query)
    @connection.exec(query)
  end
end