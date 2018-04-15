require 'pg'

module Mapper
  TABLES = { Message: 'messages', User: 'users' }

  def self.all_messages
    connect_exec "SELECT * FROM #{TABLES[:Message]} ORDER BY time DESC;"
  end

  def self.new_message params
    connect_exec "INSERT INTO messages(content, time, user_id) VALUES('#{params.content}', '#{params.time}',1);"
  end

  def self.new_user params
    (connect_exec "INSERT INTO users(first_name, last_name, username, password, email) VALUES('#{params.first_name}', '#{params.last_name}', '#{params.username}', '#{params.password}', '#{params.email}') returning id;")[0]['id']
  end

  def self.find params
    connect_exec "SELECT * FROM #{TABLES[params[:id]]} WHERE id LIKE '#{params[:id]}';"
  end

  def self.connect_exec statement
    conn = PG.connect(dbname: ENV['RACK-ENV'] == 'test' ? 'chitter_test' : 'chitter')
    result = conn.exec statement
    conn.close 
    result
  end
end
