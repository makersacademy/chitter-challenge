require 'pg'

class DB_Connection
  attr_reader :dbname, :user

  def self.setup(db_name, db_user = 'julesnuggy')
    @dbname = db_name
    @connection = PG.connect(dbname: @dbname, user: db_user)
  end

  def self.dbname
    @dbname
  end

  def self.connection
    @connection
  end

  def self.query(query_string)
    @connection.exec(query_string)
  end
end
