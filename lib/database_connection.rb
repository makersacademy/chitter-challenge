require "pg"

class DatabaseConnection
  def self.setup(name)
    @connection = PG.connect dbname: name
  end

  def self.query(sql_string)
    @connection.exec sql_string
  end
end
