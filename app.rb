ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/signup' do
    erb :signup
  end

  post '/newuser' do
    redirect '/welcome'
  end

  get '/welcome' do
    erb :welcome
  end








  # start the server if ruby file executed directly
  run! if app_file == $0
end
