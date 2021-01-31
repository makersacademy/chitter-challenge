require "sinatra/base"

class Chitter < Sinatra::Base

  get "/" do 
    erb :index
  end

  post "/new_post" do
    "writing a peep"
  end


  run! if app_file == $0
end
