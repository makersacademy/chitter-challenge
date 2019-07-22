require 'pg'

# class for manipulating/transfering peep information to and from database.
class Peep
  attr_reader :text, :id, :time
  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.post(message:)
    # added method to apostrophe in peep without causing SQL malfunction
    if message.include?("'")
      index = message.index("'")
      message.insert(index, "'")
    end
    time = Time.now.to_s[0..18] # time excluding timezone
    result = connect_to_database.exec("INSERT INTO peeps (message_text, time)
    VALUES('#{message}', '#{time}') RETURNING id, message_text, time;").first
    Peep.new(id: result['id'], text: result['message_text'],
      time: result['time'])
  end

  def self.list
    result = connect_to_database.exec('SELECT * FROM peeps
      ORDER BY time DESC;')
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['message_text'], time: peep['time'])
    end
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
