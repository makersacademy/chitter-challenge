require 'pg'

module Mapper
  TABLES = { Message: 'messages', User: 'users' }

  def self.all_messages
    connect_exec "SELECT * FROM #{TABLES[:Message]} ORDER BY time DESC;"
  end

  def self.new_message params
    connect_exec "INSERT INTO messages(content, time, user_id) \
    VALUES('#{params.content}', '#{params.time}','#{params.user_id}');"
  end

  def self.new_user params
    (connect_exec "INSERT INTO users(first_name, last_name, username,\
     password_hash, email)\
     VALUES('#{params.first_name}', '#{params.last_name}',\
     '#{params.username}', '#{params.password}',\
     '#{params.email}') returning id;")[0]['id']
  end

  def self.find_by_id params
    connect_exec "SELECT * FROM\
    #{TABLES[params[:klass]]} WHERE id = #{params[:id]};"
  end

  def self.find_by_username params
    (connect_exec "SELECT * FROM #{TABLES[params[:klass]]} WHERE\
     username LIKE '#{params[:username]}';").to_a
  end

  def self.find_by_email params
    (connect_exec "SELECT * FROM #{TABLES[params[:klass]]} WHERE\
     email LIKE '#{params[:email]}';").to_a
  end

  def self.connect_exec statement
    conn = PG.connect(dbname: ENV['RACK-ENV'] == 'test' ?
    'chitter_test' : 'chitter')
    result = conn.exec statement
    conn.close 
    result
  end
end
