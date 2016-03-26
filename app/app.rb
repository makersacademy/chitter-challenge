ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'pry'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
     # @user = User.new
     erb :'/users/new'
  end


  post '/signup' do
      user = User.new(name: params[:name], email: params[:email],
                      username: params[:username], password: params[:password],
                      password_confirmation: params[:password_confirmation])
      user.save
      session[:user_id] = user.id
    # "welcome #{params['email']}"
    # else
    #   if User.find params[:email]
    #     "welcome #{params['email']}"
    #   else
    #     'Sorry, you have not signed up'
    #   end
    # # end
    redirect '/'
  end

  get '/peeps/index' do
    erb :'peeps/index'
  end

   helpers do
   def current_user
      @current_user ||= User.get(session[:user_id])
    end
   end

    run! if app_file == $0

end
