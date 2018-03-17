require 'pg'

class ChitterConnection

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
