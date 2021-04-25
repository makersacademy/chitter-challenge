require 'pg'
class DatabaseConnection


  def self.setup(name)
    @connection = PG.connect(dbname: name)
  end

  def self.query(query)
    @connection.exec(query)
  end
end