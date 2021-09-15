require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    PG.connect(dbname: dbname, user: 'postgres', password: 'password')
  end

  def self.connection
    @connection
  end

end