require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    "Sign up"
    erb :index
  end

  run! if app_file == $0
  end
