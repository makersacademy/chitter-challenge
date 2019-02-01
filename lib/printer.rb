class Printer
  def print_out_peeps(peeps)
    peeps.reverse.map { |peep| "#{peep.content}, #{format_time(peep.created_at)}" }
  end

  private
  def format_time(date_time)
    date_time.strftime("%m/%d/%Y %H:%M")
  end
end
