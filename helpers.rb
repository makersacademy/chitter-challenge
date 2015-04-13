module Helpers

  def welcome
    @who_to_welcome = "Welcome, #{session[:username]}" if session[:username]
  end

  def grab_and_sort_peeps
    @peeps = Peep.all
    @sorted = @peeps.each.sort { |a, b| b.time <=> a.time }
  end

end
