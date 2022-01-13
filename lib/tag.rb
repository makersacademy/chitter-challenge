require_relative 'database_connection'
require 'pg'

class Tag

  def self.hashtag
    query = DatabaseConnection.query("SELECT text FROM peeps ORDER BY timestamp DESC LIMIT 1")
    peep_id = DatabaseConnection.query("SELECT id FROM peeps ORDER BY timestamp DESC LIMIT 1")
    query.map do |qr|
      arr = qr['text'].scan(/#\w+/).flatten
      arr.each do |tag|
        tagga = Tag.create(text: tag)
        peep_id.map do |pid|
          PeepTag.create(peep_id: pid['id'], tag_id: tagga.id)
        end
      end
    end
  end

  def self.create(text:)
    begin
      result = DatabaseConnection.query(
        "INSERT INTO tags (text) VALUES ($1) RETURNING id, text;",
        [text]
      )
      rescue PG::UniqueViolation
        existing_tag = DatabaseConnection.query("SELECT * FROM tags WHERE text = ($1)", [text])
        existing_tag.map do |tag|
          return Tag.new(id: tag['id'], text: tag['text'])
        end
    else
      Tag.new(
        id: result[0]['id'],
        text: result[0]['text'],
      )
    end
  end 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM tags")
    result.map do |tag|
      Tag.new(id: tag['id'], text: tag['text'])
    end
  end

  

  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

end
