require 'pg'
require 'pond'

class DatabaseConnection
  def self.setup(db_connection)
    @connection = Pond.wrap(maximum_size: 10, timeout: 0.5) {
      PG.connect(db_connection)
    }
  end

  def self.query(query)
    @connection.exec(query)
  end
end
