require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
  end

  get '/register' do
    erb :'register'
  end

  post '/registering' do
    redirect '/welcome'
  end

  get '/welcome' do
    erb :'welcome'
  end

  run! if app_file == $PROGRAM_NAME
end
