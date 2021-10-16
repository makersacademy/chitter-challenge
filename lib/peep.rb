require './lib/tag'
require './lib/peep_tag'
class Peep

  attr_reader :id, :text, :user_id, :time, :username, :likes

  def initialize(id:, text:, user_id:, timestamp: Time.now, likes:)
    @id = id
    @text = text
    @user_id = user_id
    @time = timestamp
    @likes = 0
  end


  def self.existing(tag)
    existing_tags = DatabaseConnection.query("SELECT * FROM tags;")
    arr = []
    existing_tags.map do |set_tag|
      arr << set_tag['text']
    end
      if arr.include? tag
       result = DatabaseConnection.query("SELECT * FROM tags WHERE text = '#{tag}'")
       result.map do |tag|
        return Tag.new(id: tag['id'], text: tag['text'])
      end
        puts 'tag already exists'
      else
        return Tag.create(text: tag)
        puts 'new tag created'
      end
  end

  def self.hashtag
    query = DatabaseConnection.query("SELECT text FROM peeps ORDER BY timestamp DESC LIMIT 1")
    peep_id = DatabaseConnection.query("SELECT id FROM peeps ORDER BY timestamp DESC LIMIT 1")
    query.map do |qr|
      arr = qr['text'].scan(/#\w+/).flatten
        arr.each do |tag|
          tagga = Peep.existing(tag)
            peep_id.map do |pid|
                PeepTag.create(peep_id: pid['id'], tag_id: tagga.id)
            end
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
      timestamp: result[0]['timestamp'],
      likes: result[0]['likes']
    )
    hashtag
  end

  def self.tagged(tag_id:)
    puts :tag_id
    result = DatabaseConnection.query("SELECT peep_id, text, user_id, timestamp FROM peep_tags INNER JOIN peeps ON peeps.id = peep_tags.peep_id WHERE peep_tags.tag_id = $1;", [tag_id])
    puts result
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], user_id: peep['user_id'], timestamp: peep['timestamp'], likes: peep['likes'])
    end
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER  BY timestamp;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], user_id: peep['user_id'], timestamp: peep['timestamp'], likes: peep['likes'])
    end
  end
end

