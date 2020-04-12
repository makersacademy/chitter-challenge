require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    PG.connect(dbname: dbname)
  end
end
