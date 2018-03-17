require 'pg'

class DB_Connection
  def self.setup(db_name, db_user = 'julesnuggy')
    @connection = PG.connect(dbname: db_name, user: db_user)
  end

  def self.connection
    @connection
  end
  
  def self.query(query_string)
    @connection.exec(query_string)
  end
end
