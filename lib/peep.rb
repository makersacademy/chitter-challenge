require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :content, :id, :time
  
  def initialize(content, id, time)
    @content = content
    @id = id
    @time = time
  end

  def self.create(content)
    time = Time.now.strftime("%d/%m/%Y, %I:%M %p")
    result = DatabaseConnection.query("INSERT INTO peeps (content, time) VALUES('#{content}', '#{time}') RETURNING id, content, time;")
    @peep = Peep.new(result[0]['content'], result[0]['id'], result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(peep['content'], peep['id'], peep['time'])
    end
  end
end
