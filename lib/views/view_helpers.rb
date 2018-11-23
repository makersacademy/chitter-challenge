module ViewHelpers
  def format_peep_date(date:)
    parts = date.split
    date = parts.first.split("-").reverse.join("/")
    time = parts.last.split(":").take(2).join(":")
    "Posted at #{time} on #{date}"
  end
end
