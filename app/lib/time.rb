class TodaysDate
  def todays_date_toady
    time = Time.new
    values = time.to_a
    Time.utc(*values)
  end
end
