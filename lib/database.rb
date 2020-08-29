require 'pg'

class DataBase 
  def self.connect(db_name)
    @connection =  PG.connect(dbname: db_name)
  end

  def self.current_connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end

end