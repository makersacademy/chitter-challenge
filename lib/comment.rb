require 'pg'
require_relative 'database_connection'

class Comment

  attr_accessor :id, :text, :peep_id

  def initialize(id, text, peep_id)
    @id = id
    @text = text
    @peep_id = peep_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments")
    result.map { |hash| Comment.new(hash['id'], hash['text'], hash['peep_id']) }
  end

  def self.add(text, peep_id)
    DatabaseConnection.query("INSERT INTO comments(text, peep_id) VALUES('#{text}', '#{peep_id}')")
  end

end
