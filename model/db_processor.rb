# database processor class
require 'pg'
class DbProcessor

  def self.connection
    @connection = PG.connect(dbname: 'chitter-test', password: 'qweasd')
  end

  def self.write(data, table)
    @connection = connection
    @connection.exec("INSERT INTO #{table} (message) VALUES('#{data}');")
  end

  def self.read(table)
    @connection = connection
    return @connection.exec("SELECT * FROM #{table};").map { |result| result['message'] }
  end

end
