
require "sinatra/base"
require "./lib/chitter"
require "./dbc_setup"

class ChitterApp < Sinatra::Base
  enable :sessions
  get "/" do
    @posts = Chitter.all
    erb :chitter
  end
  post "/post" do
    Chitter.create(post: params[:post])
    redirect "/"
  end
end
