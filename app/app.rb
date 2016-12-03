require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello Chitter!'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/users' do
    session[:name] = params[:name]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
