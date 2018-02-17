require 'pg'

class DatabaseConnection # returns a PG::Connection
  def self.setup(db_name)
    @database = PG.connect dbname: "#{db_name}"
  end

  def self.query(query_string) # returns a PG::Result
    result = @database.exec(query_string)
  end
end
