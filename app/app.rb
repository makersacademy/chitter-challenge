ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/database_setup'


class  Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/register/signup'
  end


  get '/register/signup' do

    erb :'register/signup'
  end

  post '/register/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    erb :'/home/homepage'
  end

  post '/home/homepage' do
    Peep.create(peep:params[:peep], time:Time.new)
    # Peep.save
    session[:peep] = params[:peep]

    redirect '/home/homepage'
  end

  get '/home/homepage' do

    erb :'home/homepage'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def peep
      @peep ||= session[:peep]
    end
  end

end
