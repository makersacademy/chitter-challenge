require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        time: peep['time']
        )
    end.reverse
  end

  def self.create(content:, time:)
    uktime = Time.now.strftime("%d %^b %Y, %H:%M")
    result = DatabaseConnection.query\
    "INSERT INTO peeps(content, time) VALUES('#{content}', '#{uktime}')
     RETURNING id, content, time;"
    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      time: result[0]['time'])
  end
end
