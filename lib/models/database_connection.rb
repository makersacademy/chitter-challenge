require 'pg'

class DatabaseConnection


def self.setup(database_name)
  @connection = PG.connect :dbname => database_name
end

def self.query(query_string)
  @connection.exec(query_string)
end

end