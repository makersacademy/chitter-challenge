require_relative 'database_connection'

class Peeps

  attr_reader :id, :text, :time_posted

  def initialize(id:, text:, time_posted:)
    @id = id
    @text = text
    @time_posted = time_posted
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
    Peeps.new(id: peep['id'], text: peep['text'], time_posted: peep['time_posted'])
    end
  end

  def self.post(text, time)
    result = DatabaseConnection.query("INSERT INTO peeps (text, time_posted) VALUES ('#{text}', '#{time}') RETURNING id, text, time_posted")
    Peeps.new(id: result[0]['id'], text: result[0]['text'], time_posted: result[0]['time_posted'])
  end

end