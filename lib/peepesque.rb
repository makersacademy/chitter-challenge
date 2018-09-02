module Peepesque
  
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
