require_relative 'database_connection'
require_relative 'userpeep'

class Peep

  attr_reader :id, :content, :time
  
  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.create(content:)
    time = Time.now.to_s[0..-7]
    result = DatabaseConnection.query("INSERT INTO peeps (content, time) VALUES ('#{content}', '#{time}') RETURNING id, content, time;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], time: peep['time'])
    end
  end

end