# database processor class
require 'pg'
class DbProcessor

  @connection = PG.connect(dbname: 'chitter-test', password: 'qweasd')
  def self.write(data, table)
    @connection.exec("INSERT INTO #{table} (message, send_time) VALUES('#{data[:msg]}','#{data[:time]}');")
  end

  def self.read(table)
    @connection.exec("SELECT * FROM #{table};").map { |result| { date: result['send_time'], msg: result['message'] }}
  end

end
