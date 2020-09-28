require 'pg'

class DBconnect

  def self.setup(dbase)
    @connection = PG.connect(dbname: dbase)
  end
  
  def self.connect
    @connection
  end

  def self.query(sql_string)
    @connection.exec(sql_string)
  end

end