require 'sinatra/base'
require 'sinatra/reloader'
require './docs/chitter'

class Chitter_app < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/login_option' do
    login_choice = params[:login_choice]
    if login_choice == "Register"
      redirect '/register'
    elsif login_choice == "Log in"
      redirect '/login'
    end
  end

  get '/login' do
    erb :login
  end

  get '/register' do
    erb :register
  end



  run! if app_file == $0
end
