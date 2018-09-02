require_relative 'database_connection'

class Peep
  attr_reader :text, :time

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps")
    rs.map{ |peep| Peep.new(peep['comment']) }
  end

  def self.create(text)
    rs = DatabaseConnection.query("INSERT INTO peeps (comment) VALUES ('#{text}') RETURNING id, comment, user_id, time;")
    Peep.new(rs[0]['comment'])
  end

  def initialize(text)
    @text = text
    @time = Time.new
  end

  def nice_date
    day = two_digit(time.day.to_s)
    month = two_digit(time.month.to_s)
    "#{day}-#{month}-#{time.year}"
  end

  def nice_time
    p time.min
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
