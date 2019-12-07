require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb:'homepage'
  end

  get '/register/new' do
    erb:'register'
  end

  post '/register' do
    redirect '/'
  end


  run! if app_file == $0
end
