require_relative './database_connection'

class Comment
  attr_reader :id, :text, :time

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO comments (link_id, text, time) VALUES('#{options[:link_id]}', '#{options[:text]}', '#{options[:time]}') RETURNING id, text, time")
    Comment.new(result[0]['id'], result[0]['text'], result[0]['time'])
  end
end
