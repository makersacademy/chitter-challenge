class Printer
  def print_out_peeps(peeps, user = User)
    peeps.reverse.map { |peep| "#{peep.content} - #{get_user(peep.user_id, user)}, #{format_time(peep.created_at)}" }
  end

  private

  def get_user(id, user)
    user.get(id).username
  end

  def format_time(date_time)
    date_time.strftime("%m/%d/%Y %H:%M")
  end
end
