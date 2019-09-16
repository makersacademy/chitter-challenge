require 'pg'

class Honk

  attr_reader :id, :text, :time
  
  def self.all
    result = DatabaseConnection.query("SELECT * FROM honks;")
    result.map do |honk| 
      Honk.new(id: honk['id'], text: honk['text'], time: honk['time'])
    end 
  end

  def self.add(text:)
    time = Time.new
    result = DatabaseConnection.query("INSERT INTO honks (text, time) VALUES ('#{text}', '#{time}') RETURNING id, text, time;")
    Honk.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end
end
