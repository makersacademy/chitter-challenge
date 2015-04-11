class Chittter < Sinatra::Base
  get '/' do
    get_and_sort_peeps
    welcome
    erb :index
  end
end