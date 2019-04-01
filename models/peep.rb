require 'pg'

class Peep

  attr_reader :id, :timestamp, :message, :user_id, :username

  def initialize(id:, user_id:, username:, timestamp:, message:)
    @id = id
    @timestamp = timestamp
    @message = message
    @user_id = user_id
    @username = username
  end

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end
    
    result = connection.exec("SELECT * FROM peep_messages ORDER BY timestamp DESC;")
    
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], timestamp: peep['timestamp'], user_id: peep['user_id'], username: peep['username'])
    end
  end

  def self.create(message:, user:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("INSERT INTO peep_messages (message, user_id, username) VALUES('#{message}', '#{user}','#{username}' ) RETURNING id, timestamp, user_id, username, message;")
    Peep.new(id: result[0]['id'], timestamp: result[0]['timestamp'], user_id: result[0]['user_id'], username: result[0]['username'], message: result[0]['message'])
  end

end