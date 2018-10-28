class Peep
  attr_reader :id, :text, :time, :date, :user

  def initialize(id:, text:, time:, date:, user: User.new)
    @id = id
    @text = text
    @time = time
    @date = date
    @user = user
  end

  def self.all
    result = DatabaseConnection.query("
      SELECT * FROM peeps INNER JOIN users ON user_id = users.id
      ORDER BY time DESC;
    ")

    result.map { |peep|
      user = user(peep)
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'][0..4],
      date: format_date(peep['date']), user: user
      )
    }
  end

  def self.create(text:, user: User.new)
    DatabaseConnection.query("
      INSERT INTO
      peeps (text, time, date, user_id)
      VALUES
      ('#{text}', '#{Peep.current_time}', '#{Peep.current_date}',
        '#{user.id}');
    ")
  end

  private_class_method

  def self.current_time
    Time.now.strftime("%H:%M:%S")
  end

  def self.current_date
    Time.now.strftime("%Y-%m-%d")
  end

  def self.format_date(date)
    "#{date[8..9]}/#{date[5..6]}/#{date[0..3]}"
  end

  def self.user(peep)
    return User.new if peep['id'] == 1
    User.new(id: peep['id'], name: peep['name'], username: peep['username'],
      email: peep['email'])
  end
end
