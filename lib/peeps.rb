require 'pg'
require_relative 'database_connection'
require 'time'

class Peeps
  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        content: peep['content'],
        time: peep['time_created']
      )
    end
  end

  def self.create(content:)
    time = Time.now.strftime('%T')
    result = DatabaseConnection.query("INSERT INTO peeps (content, time_created) 
      VALUES('#{content}', '#{time}') 
      RETURNING id, content")

    Peeps.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time_created'])
  end
end
