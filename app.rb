require "sinatra/base"

class Chitter < Sinatra::Base
  get "/sign_up" do
    erb :index
  end

  run! if app_file == $0
end
