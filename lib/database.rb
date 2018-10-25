require 'pg'

class Database

  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG.connect(dbname: 'chitter_database_test')
    else
      @conn = PG.connect(dbname: 'chitter_database_test')
    end
  end

  def self.query(sql)
    setup
    @conn.exec(sql)
  end

end
