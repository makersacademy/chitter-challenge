require 'pg'

# class for manipulating/transfering peep information to and from database.
class Peep
  attr_reader :text, :id
  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.post(message:)
    # added method to apostrophe in peep without causing SQL malfunction
    if message.include?("'")
      index = message.index("'")
      message.insert(index, "'")
    end
    result = connect_to_database.exec("INSERT INTO peeps (message_text)
    VALUES('#{message}') RETURNING id, message_text;")
    Peep.new(id: result[0]['id'], text: result[0]['message_text'])
  end

  def self.list
    result = connect_to_database.exec('SELECT message_text FROM peeps;')
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['message_text'])
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
