require_relative 'database_connection'
require 'pg'

class Tag

  def self.create(text:)
    result = DatabaseConnection.query(
      "INSERT INTO tags (text) VALUES ($1) RETURNING id, text;",
      [text]
    )
    Tag.new(
      id: result[0]['id'],
      text: result[0]['text'],
    )
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

