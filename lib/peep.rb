require 'pg'
require_relative 'database_connection'

class Peep

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY posted_time DESC;")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'],
        posted_time: peep['posted_time']
      )
    end
  end

  def self.create(text:, posted_time:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, posted_time) VALUES('#{text}', '#{posted_time}') RETURNING id, text, posted_time;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], posted_time: result[0]['posted_time'])
  end

  attr_reader :id, :text, :posted_time

  def initialize(id:, text:, posted_time:)
    @id = id
    @text = text
    @posted_time = posted_time
  end

end
