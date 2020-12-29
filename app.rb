
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
    # date = Time.new
    Chitter.create(post: params[:post], date: Time.new.strftime("%A, %d/%b/%y at %I:%M %p"))
    redirect "/"
  end
end
