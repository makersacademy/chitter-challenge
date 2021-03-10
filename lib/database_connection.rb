require 'pg'

class DatabaseConnection

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.query(sql)
    result = @connection.exec(sql)
    
  end

end