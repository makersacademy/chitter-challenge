class Peep
  attr_reader :id, :text, :timestamp, :user_id

  def initialize(id:, text:, timestamp:, user_id:)
    @id = id
    @text = text
    @timestamp = timestamp
    @user_id = user_id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'],
        user_id: peep['user_id'], timestamp: peep['timestamp'])
    end
  end

  def self.create(text:, user_id:, timestamp: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (text, timestamp, user_id)
      VALUES('#{text}', '#{timestamp}', '#{user_id}') RETURNING id, text, timestamp, user_id")
    Peep.new(id: result[0]['id'], text: result[0]['text'],
      user_id: result[0]['user_id'], timestamp: result[0]['timestamp'])
  end
end
