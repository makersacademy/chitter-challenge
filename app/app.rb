require 'sinatra/base'

class ChitterApp < Sinatra::Base
  get "/" do
    erb :index
  end

  post "/peeps" do
    erb :peeps_list
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
