require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    
  end

  get '/' do
    if session[:logged_in] == true
      erb :index
    else
      redirect '/log-in'
    end
  end

  run! if app_file == $0
end