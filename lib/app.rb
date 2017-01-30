require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Hello Chitter!'
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
