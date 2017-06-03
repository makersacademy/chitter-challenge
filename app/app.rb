require 'sinatra/base'

class Chitter < Sinatra::Base

  get "/" do
    erb :index
  end

  get "/new_peep" do
    erb :make_peep
  end

end
