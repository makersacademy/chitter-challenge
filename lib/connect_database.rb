require 'pg'

class ConnectDatabase

  def self.start(pg_class = PG)
    @connection = pg_class.connect(dbname: which_database)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end

  private

  def self.which_database
    if ENV['ENVIRONMENT'] == 'test'
      return 'test_chitter_database'
    else
      return 'chitter_database'
    end
  end

end
