module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def format_date_time(datetime)
    datetime.strftime("%c")
  end

  def peeps_latest_first(peeps)
    # p Peep.all
    peeps.sort {|peep1, peep2| peep2.created_at <=> peep1.created_at}
    # Peep.all.sort {|peep1.created_at, peep2.created_at| peep2.created_at <=> peep1.created_at}
  end

end
