require 'pg'
require_relative 'database_connection'

class Peeps
  attr_reader :id, :text, :posted_at

  def initialize(id: id,text: text, posted_at: posted_at)
    @id = id
    @text = text
    @posted_at = posted_at
  end

  def self.all
      result = DatabaseConnection.query("SELECT * FROM peeps;")
      result.map do |peep|
        Peeps.new(id: peep['id'], text: peep['text'], posted_at: peep['posted_at'])
      end
  end

  def self.new_peep(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text, posted_at;")
    Peeps.new(id: result[0]['id'], text: result[0]['text'], posted_at: result[0]['posted_at'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
  end

end
