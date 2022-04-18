require_relative './database_connection'
require 'date'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        time_created: peep['time_created'],
        content: peep['content']
      )
    end
  end

  def self.create(content:)
    time_created = Time.now
    result = DatabaseConnection.query(
      "INSERT INTO peeps(time_created, content) VALUES($1, $2) RETURNING id, time_created, content;",
      [time_created, content]
    )
    Peep.new(id: result[0]['id'], time_created: result[0]['time_created'], 
content: result[0]['content'])
  end

  attr_reader :id, :time_created, :content

  def initialize(id:, time_created:, content:)
    @id = id
    @time_created = DateTime.parse(time_created)
    @content = content
  end

end
