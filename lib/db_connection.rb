require 'pg'

class DBConnection

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.connection
    @connection
  end


end
