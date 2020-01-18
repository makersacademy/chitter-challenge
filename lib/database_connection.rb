require 'pg'

class DatabaseConnection

  def self.setup(database)
    @connection = PG.connect(:dbname => database)
  end

end