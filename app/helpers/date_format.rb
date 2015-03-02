module DateFormat

  def date_format(datetime)
    datetime = datetime.to_s.slice(0, 16)
    datetime.sub("T", " ")
  end

end