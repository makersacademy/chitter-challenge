require "sinatra/base"
#require "pg"

class ChitterApp < Sinatra::Base
  enable :sessions

  get "/" do
    erb :index
  end

  post "/username" do
    session[:username] = params[:username]
    redirect("/enter_peep")
  end
  get "/enter_peep" do
    erb :peep
  end

  post "/display_peep" do
    session[:peep] = params[:peep]
  end
  run! if app_file == $0
end
