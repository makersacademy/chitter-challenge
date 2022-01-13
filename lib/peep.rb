require './lib/tag'
require './lib/peep_tag'
class Peep

  attr_reader :id, :text, :user_id, :time, :username, :likes

  def initialize(id:, text:, user_id:, timestamp: Time.now)
    @id = id
    @text = text
    @user_id = user_id
    @time = timestamp
    @likes = 0
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
  end

  def self.tagged(tag_id:)
    puts :tag_id
    result = DatabaseConnection.query(
"SELECT peep_id, text, user_id, timestamp FROM peep_tags INNER JOIN peeps ON peeps.id = peep_tags.peep_id WHERE peep_tags.tag_id = $1;", [tag_id])
    puts result
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], user_id: peep['user_id'], 
timestamp: peep['timestamp'])
    end
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER  BY timestamp;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], user_id: peep['user_id'], 
timestamp: peep['timestamp'])
    end
  end
end
