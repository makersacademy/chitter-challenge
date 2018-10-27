class Peep
  attr_reader :id, :text, :time, :date, :username

  def initialize(id:, text:, time:, date:, username: 'anonymous')
    @id = id
    @text = text
    @time = time
    @date = date
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("
      SELECT * FROM peeps
      ORDER BY time DESC
    ")

    result.map { |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'][0..4],
        date: "#{peep['date'][8..9]}/#{peep['date'][5..6]}/#{peep['date'][0..3]}",
        username: peep['username'])
    }
  end

  def self.create(text:, username: 'anonymous')
    DatabaseConnection.query("
      INSERT INTO
      peeps (text, time, date, username)
      VALUES
      ('#{text}', '#{Peep.current_time}', '#{Peep.current_date}',
        '#{username}');
    ")
  end

  private_class_method

  def self.current_time
    Time.now.strftime("%H:%M:%S")
  end

  def self.current_date
    Time.now.strftime("%Y-%m-%d")
  end

end
