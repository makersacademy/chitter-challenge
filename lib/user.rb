require 'pg'
require './lib/message'

class User


  def self.add(username, tag)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    connection.exec("INSERT INTO users (username, tag) VALUES ('#{username}', '#{tag}');")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end

    result = connection.exec("SELECT * FROM users ORDER BY date;")
    @user_added = result.map { |user|
      {username: user['username'], tag: user['tag'], date: user['date']}
    }
  end

  def self.last
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end

    result = connection.exec("SELECT * FROM users ORDER BY date DESC LIMIT 1;")
    @last_user = result.map { |user|
      {username: user['username']}
    }

    # result = connection.exec("SELECT * FROM users ORDER BY date DESC LIMIT 1;")
    # @last_user = result.map { |user|
    #   {username: user['username'], tag: user['tag'], date: user['date']}
    # }
  end

end
