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
      if peep['id'] == 1
        user = User.new
      else
        user = User.new(id: peep['id'], name: peep['name'], username: peep['username'], email: peep['email'])
      end

      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'][0..4],
      date: "#{peep['date'][8..9]}/#{peep['date'][5..6]}/#{peep['date'][0..3]}", user: user
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

  # def self.user(id)
  #   return User.new if id == '1'
  #   User.new(id: peep['user_id'], name: peep['name'], username: peep['username'], email: peep['email'])
  # end

end
