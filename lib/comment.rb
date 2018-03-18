require_relative './database_connection'

class Comment
  attr_reader :link_id, :text, :time

  def initialize(link_id, text, time)
    @link_id = link_id
    @text = text
    @time = time
  end

  def self.create(options)
    result = DatabaseConnection.query("INSERT INTO comments (link_id, text, time) VALUES('#{options[:link_id]}', '#{options[:text]}', '#{options[:time]}') RETURNING link_id, text, time")
    Comment.new(result[0]['link_id'], result[0]['text'], result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments")
    result.map { |comment| Comment.new(comment['link_id'], comment['text'], comment['time']) }
  end

end
