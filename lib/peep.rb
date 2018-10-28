class Peep
  attr_reader :id, :text, :user_id, :timestamp

  def initialize(id:, text:, user_id:, timestamp:)
    @id = id
    @text = text
    @user_id = user_id
    @timestamp = timestamp
  end

  def self.create(text:, user_id:, timestamp: Time.now)
    result = connection.exec("INSERT INTO peeps (text, user_id, timestamp) VALUES ('#{text}', #{user_id}, '#{timestamp}') RETURNING id")
    id = result.first["id"].to_i

    Peep.new(id: id, text: text, user_id: user_id, timestamp: timestamp)
  end

  def self.all
    peeps = connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC")
    peeps.map {|peep| Peep.new(id: peep["id"].to_i, text: peep["text"], user_id: peep["user_id"], timestamp: peep["timestamp"]) }
  end

  private
  def self.connection
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end
