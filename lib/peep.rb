require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :text, :time, :author, :replying_to
  
  def initialize(id:, text:, time:, author:, replying_to: nil)
    @id = id
    @text = text
    @time = time
    @author = author
    @replying_to = replying_to
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map do |peep| 
      Peep.new(id: peep['id'], text: peep['text'], time: time(peep['time']),
      author: peep['author'], replying_to: peep['replying_to'])
    end.sort_by { |peep| peep.time }.reverse

    # time doesn't sort accurately with sql ORDER BY
    # it's also useful to convert back to a time object here for presenting in html
  end

  def self.create(text:, author:, peep: nil)
    if peep
      result = DatabaseConnection.query(
        "INSERT INTO peeps(text, time, author, replying_to) VALUES($1, $2, $3, $4) RETURNING *;",
        [text, Time.now.utc, author, peep]
      )
    else
      result = DatabaseConnection.query(
        "INSERT INTO peeps(text, time, author) VALUES($1, $2, $3) RETURNING *;",
        [text, Time.now.utc, author]
      )
    end
  
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: time(result[0]['time']),
    author: result[0]['author'], replying_to: result[0]['replying_to'])
  end

  def self.find(id:)
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE id = $1;", [id]
    )
    return unless result.any?

    Peep.new(id: result[0]['id'], text: result[0]['text'], time: time(result[0]['time']),
    author: result[0]['author'], replying_to: result[0]['replying_to'])
  end

  def self.replies(id:)
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE replying_to = $1;", [id]
    )
    return unless result.any?

    result.map do |peep| 
      Peep.new(id: peep['id'], text: peep['text'], time: time(peep['time']),
      author: peep['author'], replying_to: peep['replying_to'])
    end.sort_by { |peep| peep.time }.reverse
  end

  def self.time(string)
    Time.strptime(string, '%Y-%m-%d %H:%M:%S')
  end
  
end
