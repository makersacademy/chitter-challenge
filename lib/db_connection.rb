require 'pg'

class DbConnection

  def self.setup(db)
    @DB = PG.connect(dbname: db)
  end

  def self.query(query_string)
    @DB.exec(query_string)
  end
    
  
end