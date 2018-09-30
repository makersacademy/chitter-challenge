class Peep
  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT id, text, time FROM peeps ORDER BY hidden_timestamp DESC')
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text'], time: peep['time']) }
  end

  def self.add(text, time = Time.now)
    result = DatabaseConnection.query("INSERT INTO peeps (text, time, hidden_timestamp) VALUES ('#{text}', '#{time.strftime("%I:%M%p on %d/%m/%Y")}', current_timestamp) RETURNING id, text, time;")

    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end
end