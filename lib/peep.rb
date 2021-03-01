require_relative 'db_connection'

class Peep
  attr_reader :id, :content, :date, :time, :user_id

  def self.create(content:, date:, time:, user_id:)
    result = DBConnection.query("INSERT INTO peeps (content, date, time, user_id) VALUES('#{content}', '#{date}', '#{time}', '#{user_id}') RETURNING id, content, date, time, user_id;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], date: result[0]['date'], time: result[0]['time'], user_id: result[0]['user_id'])
  end

  def self.all
    result = DBConnection.query("SELECT content, date, time, user_id FROM peeps ORDER BY date DESC, time DESC;")
    result.map { |row| Peep.new(id: row['id'], content: row['content'], date: row['date'], time: row['time'], user_id: row['user_id']) }
  end

  def initialize(id:, content:, date:, time:, user_id:)
    @id = id
    @content = content
    @date = date
    @time = time
    @user_id = user_id
  end

  def peeped_by(user_class = User)
    user_class.find(id: @user_id).name
  end

  def username(user_class = User)
    user_class.find(id: @user_id).username
  end

end
