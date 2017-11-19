ENV["RACK-ENV"] = "development"

require "sinatra/base"
require "./app/models/peep"

class Chitter < Sinatra::Base
  get "/" do
    redirect "/new_peep"
  end

  get "/new_peep" do
    erb :new_peep
  end

  post "/save_peep" do
    message = params[:peep]
    Peep.create(message: message)
    redirect "/new_peep"
  end

  run! if app_file == $0
end
