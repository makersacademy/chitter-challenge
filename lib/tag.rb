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


  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end


end

