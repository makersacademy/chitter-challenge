require 'pg'
require 'time'

class DBTools
  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else
      conn = PG.connect( dbname: 'chitter' )
    end
    result = conn.exec("SELECT * FROM messages ORDER BY created_at DESC")
    result.map do |message|
      p message
    end 
  end 

  def self.setup_test_database
    conn = PG.connect( dbname: 'chitter_test' )
    conn.exec("TRUNCATE messages")
  end

  def self.insert(user_name, message)
    conn = PG.connect( dbname: 'chitter' )
    conn.exec("INSERT INTO messages(user_name, message) VALUES('#{user_name}','#{message}')")
  end
end 
