require 'sinatra'

class Chitter < Sinatra::Base

  get "/" do
    redirect "/login"
  end

  get "/login" do
    erb :login
  end

  get "/home" do
    erb :home
  end

  run! if app_file == $0
end
