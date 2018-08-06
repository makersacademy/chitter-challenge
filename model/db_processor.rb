# database processor class
require 'pg'
class DbProcessor

  @connection = PG.connect(dbname: 'chitter-test', password: 'qweasd')

  def self.write(data, table)
    if table == 'twats'
      @connection.exec("INSERT INTO #{table} (message, send_time) VALUES('#{data[:msg]}','#{data[:time]}');")
    elsif table == 'users'
      @connection.exec("INSERT INTO #{table} (username, password, email, name) VALUES('#{data[:username]}','#{data[:password]}','#{data[:email]}','#{data[:name]}');")
    end
  end

  def self.read(table)
    if table == 'twats'
      @connection.exec("SELECT * FROM #{table};").map { |result| { date: result['send_time'], msg: result['message'] }}
    elsif table == 'users'
      @connection.exec("SELECT * FROM #{table};").map { |result| { username: result['username'], name: result['name'] } }
    end
  end

  def self.get_user_id(username)
    @connection.exec("SELECT * FROM users WHERE username LIKE '#{username}';").map { |result| result['id'] }.join.to_i
  end
end
