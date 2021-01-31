require "sinatra/base"

class Chitter < Sinatra::Base
  enable :sessions


  get "/" do
    @post = session[:post]
    erb :index
  end

  post "/new_post" do
    session[:post] = params["text"]
    redirect "/"
  end


  run! if app_file == $0
end
