class Peep
  attr_reader :id, :text, :timestamp

  def initialize(id:, text:, timestamp:)
    @id = id
    @text = text
    @timestamp = timestamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], timestamp: peep['timestamp'])
    end
  end

  def self.create(text:, timestamp: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (text, timestamp) VALUES('#{text}', '#{timestamp}') RETURNING id, text, timestamp")
    Peep.new(id: result[0]['id'], text: result[0]['text'], timestamp: result[0]['timestamp'])
  end
end
