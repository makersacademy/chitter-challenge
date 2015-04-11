class Chittter < Sinatra::Base

  def welcome
    @who_to_welcome = "Welcome, #{session[:username]}" if session[:username]
  end

  def get_and_sort_peeps
    @peeps = Peep.all
    @sorted = @peeps.each.sort{|a, b| b.time <=> a.time}
  end
  get '/' do
    get_and_sort_peeps
    welcome
    erb :index
  end
end