require_relative 'database_connection'

class Peep
  attr_reader :text, :time

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps")
    rs.map{ |peep| Peep.new(peep['comment'], peep['time']) }
  end

  def self.create(text)
    rs = DatabaseConnection.query("INSERT INTO peeps (comment, time) VALUES ('#{text}', '#{Time.new}') RETURNING id, comment, user_id, time;")
    Peep.new(rs[0]['comment'], rs[0]['time'])
  end

  def initialize(text, time)
    time = Time.parse(time)
    @text = text
    @time = time
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
