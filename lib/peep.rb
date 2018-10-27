class Peep
  attr_reader :id, :text, :time, :username

  def initialize(id:, text:, time:, username: 'anonymous')
    @id = id
    @text = text
    @time = time
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("
      SELECT * FROM peeps
      ORDER BY time DESC
    ")

    p result.map { |peep|
      Peep.new(id: peep['id'],
        text: peep['text'],
        time: peep['time'],
        username: peep['username'])
    }
  end
end
