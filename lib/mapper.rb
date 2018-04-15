require 'pg'

module Mapper
  TABLES = { Message: 'messages', User: 'users' }

  def self.all_messages
    connect_exec "SELECT * FROM #{TABLES[:Message]} ORDER BY time DESC;"
  end

  def self.new_message params
    connect_exec "INSERT INTO messages(content, time, user_id) VALUES('#{params.content}', '#{params.time}',1);"
  end

  def self.connect_exec statement
    conn = PG.connect(dbname: ENV['RACK-ENV'] == 'test' ? 'chitter_test' : 'chitter')
    result = conn.exec statement
    conn.close 
    result
  end
end
