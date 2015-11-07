require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/users/log-in' do
    erb :'users/log-in'
  end

  get '/users/sign-up' do
    erb :'users/sign-up'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
