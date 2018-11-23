require 'pg'

class DatabaseConnection

  def self.setup(name)
    @connection = PG.connect(dbname: name)
  end

  def self.connection
    @connection
  end

  def self.query(command)
    @connection.exec(command)
  end

end
