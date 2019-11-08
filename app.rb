require "sinatra/base"
require "pg"
require "./lib/chitter"

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
    redirect "/peep_page"
  end
  get "/peep_page" do
    $chitter = Chitter.new
    @fullPeep = "#{$chitter.username} peeped #{$chitter.peep} at #{$chitter.time}"
    erb :peep_display
  end
  run! if app_file == $0
end
