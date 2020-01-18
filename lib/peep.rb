require_relative 'database_connection'

class Peep

  attr_reader :id, :text, :timestamp, :user_id, :username

  def initialize(id:, text:, timestamp:, user_id:, username:)
    @id = id
    @text = text
    @timestamp = timestamp
    @user_id = user_id
    @username = username
  end

  def self.all
    DatabaseConnection.setup(environment)
    result = DatabaseConnection.query("SELECT * FROM peeps INNER JOIN users ON peeps.user_id=users.id")
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text'], timestamp: peep['timestamp'], user_id: peep['user_id'], username: peep['username'] ) }
  end

  def self.create(text:, timestamp: Time.now.strftime("%Y-%m-%d %H:%M"), user_id:)
    DatabaseConnection.setup(environment)
    DatabaseConnection.query("INSERT INTO peeps (text, timestamp, user_id) VALUES ('#{text}', '#{timestamp}', '#{user_id}') RETURNING id, text, timestamp, user_id")
  end

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_app_test' : 'chitter_app'
  end

end
