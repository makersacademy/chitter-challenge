class Peep
  attr_reader :id, :text, :user_id, :timestamp

  def initialize(id:, text:, user_id:, timestamp:)
    @id = id
    @text = text
    @user_id = user_id
    @timestamp = timestamp
  end

  def self.create(text:, user_id:)
    timestamp = Time.now
    result = connection.exec("INSERT INTO peeps (text, user_id, timestamp) VALUES ('#{text}', #{user_id}, '#{timestamp}') RETURNING id")
    id = result.first["id"].to_i

    Peep.new(id: id, text: text, user_id: user_id, timestamp: timestamp)
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
