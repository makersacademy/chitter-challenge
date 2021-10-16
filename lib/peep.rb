require './lib/tag'

class Peep

  attr_reader :id, :text, :user_id, :time, :username

  def initialize(id:, text:, user_id:, timestamp: Time.now)
    @id = id
    @text = text
    @user_id = user_id
    @time = timestamp
  end

  def self.hashtag
    query = DatabaseConnection.query("SELECT text FROM peeps ORDER BY timestamp DESC LIMIT 1")
    query.map do |qr|
      arr = qr['text'].scan(/#\w+/).flatten
      arr.each do |tag|
      Tag.create(text: tag)
      end
    end
  end

  def self.create(text:, user_id:, timestamp:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, user_id, timestamp) VALUES ($1, $2, $3) RETURNING id, text, user_id, timestamp;",
      [text, user_id, timestamp]
    )
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      user_id: result[0]['user_id'],
      timestamp: result[0]['timestamp']
    )
    hashtag
  end

  

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], user_id: peep['user_id'], timestamp: peep['timestamp'])
    end
  end
end