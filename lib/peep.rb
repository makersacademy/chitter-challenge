require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :content, :date

  def initialize(id:, content:, date:)
    @id = id
    @content = content
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date DESC")

    result.map { |peep| 
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        date: peep['date']
      )}
  end

  def self.create(content:, time:)
    result = DatabaseConnection.query("INSERT INTO peeps (content, date) VALUES('#{content}', '#{time}') RETURNING id, content, date;")
    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      date: result[0]['date']
      )
  end

end
