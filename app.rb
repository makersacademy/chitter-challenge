require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/login' do
    session[:username] = params[:username]
    redirect '/login'
  end

  get '/login' do
    @username = session[:username]
    erb :login
  end

  run! if app_file == $0
end
