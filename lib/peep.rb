require 'pg'
require 'database_connection'

class Peep

  attr_reader :id, :text, :time
  
  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map do |peep| 
      Peep.new(id: peep['id'], text: peep['text'],
      time: time(peep['time']))
    end.sort_by { |peep| peep.time }.reverse

    # time doesn't sort accurately with sql ORDER BY
    # it's also useful to convert back to a time object here for presenting in html
  end

  def self.create(text:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps(text, time) VALUES($1, $2) RETURNING id, text, time;", [text, Time.now.utc]
    )
  
    Peep.new(id: result[0]['id'], text: result[0]['text'],
    time: time(result[0]['time']))
  end

  private

  def self.time(string)
    Time.strptime(string, '%Y-%m-%d %H:%M:%S')
  end
  
end
