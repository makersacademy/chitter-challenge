require "sinatra/base"
require "sinatra/activerecord"

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension


  get "/" do
    erb :index
  end

  post "/new_post" do
    session[:post] = params["text"]
    redirect "/"
  end


  run! if app_file == $0
end
