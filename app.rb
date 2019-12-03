require 'sinatra/base'

class App < Sinatra::Base

  get '/' do
    "Sign up"
    erb :index
  end

  post '/signin' do
     "Sign In"
    erb :Signin
  end

  run! if app_file == $0
  end
