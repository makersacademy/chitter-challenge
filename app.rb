require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :splash
  end
  
  get '/register' do
    erb :register
  end

  post '/home' do
    erb :home
  end

  run! if app_file == $0
end
