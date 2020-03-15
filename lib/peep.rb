require_relative 'database_connection'

class Peep
  attr_reader :id, :text, :time
  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.create(text:)

    result = DatabaseConnection.query("INSERT INTO peeps (text, time) VALUES('#{text}', '#{Time.now.getutc}') RETURNING id, text, time")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps')
    result = peeps.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])
    end
    result.sort_by { |peep| -Time.parse(peep.time).to_i }
  end
end
