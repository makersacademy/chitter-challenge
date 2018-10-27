require_relative "database_manager"

class Peep
  attr_reader :id, :text, :time, :user_id

  def self.all
    select_all.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'],
        user_id: peep['user_id'])
    end
  end

  def self.create(text, user_id)
    return false if text.empty?
    DatabaseManager.query("INSERT INTO peeps(text,time,user_id) " \
    "VALUES('#{text}', '#{format_time(Time.now)}', '#{user_id}') " \
    "RETURNING id, text, time, user_id")
  end

  def self.format_time(time)
    time.strftime('%d %b %Y, %H:%M')
  end

  def self.select_all
    DatabaseManager.query('SELECT * FROM peeps')
  end

  def initialize(id:, text:, time:, user_id:)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
  end

  def user(user_class = User)
    user_class.find(@user_id)
  end

  private_class_method :format, :select_all
end
