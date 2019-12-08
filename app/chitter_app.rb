require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/chitter/home' do
    erb :'index'
  end

  post '/login' do 

  end

  run! if app_file == $0
end