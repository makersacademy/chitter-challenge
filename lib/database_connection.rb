require "pg"

class DatabaseConnection

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
    @connection.exec("DEALLOCATE ALL")
    @connection.prepare('list_tweets', 'SELECT * FROM tweets ORDER BY time DESC;')
    @connection.prepare('add_new_tweet', "INSERT INTO tweets(username, message) VALUES ($1, $2);")
    @connection.prepare("insert_new_user", "INSERT INTO users (username, email, first_name, last_name, password) VALUES ($1, $2, $3, $4, $5);")
    @connection.prepare('sign_in', "SELECT COUNT(*) FROM users WHERE username=$1 AND password=$2;")
  end

  class << self
    attr_reader :connection
  end

  def self.exec_prepared(statement, params)
    @connection.exec_prepared(statement, params)
  end 

end
