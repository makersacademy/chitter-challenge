class Peep
  attr_reader :id, :text, :time, :user_id, :username

  def initialize(id:, text:, time:, user_id:, username:)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
    @username = username
  end

  def self.add(text, user_id, username, time = Time.now)
    result = DatabaseConnection.query("INSERT INTO peeps (text, time, hidden_timestamp, user_id, user_username) VALUES ('#{text}', '#{time.strftime("%I:%M%p on %d/%m/%Y")}', current_timestamp, '#{user_id}', '#{username}') RETURNING id, text, time, user_id, user_username;")

    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], user_id: result[0]['user_id'], username: result[0]['user_username'])
  end

  def self.all
    result = DatabaseConnection.query('SELECT id, text, time, user_id, user_username FROM peeps ORDER BY hidden_timestamp DESC')
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text'], time: peep['time'], user_id: peep['user_id'], username: peep['user_username']) }
  end
end
