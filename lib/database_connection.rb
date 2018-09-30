require 'pg'

class DatabaseConnection
  def self.connection
    PG.connect(dbname: 'chitter_test')
  end

  def self.query(sql)
    connection.exec(sql)
  end
end
