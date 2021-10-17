require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :text, :time, :author
  
  def initialize(id:, text:, time:, author:)
    @id = id
    @text = text
    @time = time
    @author = author
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map do |peep| 
      Peep.new(id: peep['id'], text: peep['text'],
      time: time(peep['time']), author: peep['author'])
    end.sort_by { |peep| peep.time }.reverse

    # time doesn't sort accurately with sql ORDER BY
    # it's also useful to convert back to a time object here for presenting in html
  end

  def self.create(text:, author:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps(text, time, author) VALUES($1, $2, $3) RETURNING *;",
      [text, Time.now.utc, author]
    )
  
    Peep.new(id: result[0]['id'], text: result[0]['text'],
    time: time(result[0]['time']), author: result[0]['author'])
  end

  def self.time(string)
    Time.strptime(string, '%Y-%m-%d %H:%M:%S')
  end
  
end
