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
    User.create_user_account(params[:email], params[:password])
    session[:user_id] = User.user.id
    p User.id

    erb :'/home/homepage'
  end

  helpers do
    def current_user
      @current_user ||= session[:user_id]
    end
  end



end
