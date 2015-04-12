class Chittter < Sinatra::Base

  get '/' do
    grab_and_sort_peeps
    welcome
    erb :index
  end

end
