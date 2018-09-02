require_relative 'database_connection'
require_relative 'user'

class Peep
  attr_reader :text, :time, :username, :name

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps")
    rs.map{ |peep| Peep.new(peep['user_id'], peep['comment'], peep['time']) }
  end

  def self.create(text, user_klass = User)
    user_id = user_klass.active.id
    rs = DatabaseConnection.query("INSERT INTO peeps (user_id, comment, time) VALUES ('#{user_id}', '#{text}', '#{Time.new}') RETURNING id, comment, user_id, time;")
    Peep.new(rs[0]['user_id'], rs[0]['comment'], rs[0]['time'])
  end

  def initialize(user_id, text, time)
    time = Time.parse(time)
    @user_id = user_id
    @username, @name = get_user_detail(user_id)
    @text = text
    @time = time
  end

  def get_user_detail(target_user_id)
    rs = DatabaseConnection.query("SELECT username, name FROM users WHERE id = #{target_user_id}")
    [rs[0]['username'], rs[0]['name']]
  end

  def nice_date
    day = two_digit(time.day.to_s)
    month = two_digit(time.month.to_s)
    "#{day}-#{month}-#{time.year}"
  end

  def nice_time
    min = two_digit(time.min.to_s)
    hour = two_digit(time.hour.to_s)
    "#{hour}:#{min}"
  end

private
  def two_digit(str)
    if str.length == 1
      return str.prepend("0")
    else
      return str
    end
  end
end
