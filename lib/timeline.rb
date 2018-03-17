require "database"

class Timeline
  attr_reader :id, :author, :text, :time, :reply_id
    
  def initialize(id, author, text, time, reply_id)
    @id = id,
    @author = author,
    @text = text,
    @time = time,
    @reply_id = reply_id
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')

    result.map { |peep|
      Timeline.new(
        peep['id'], peep['author'],
        peep['text'],
        peep['time'],
        peep['reply_id']
      )
    }
  end
end
