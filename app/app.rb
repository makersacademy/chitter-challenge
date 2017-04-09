ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'


class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.new(first_name: params[:first_name],
                     last_name: params[:last_name],
                         email: params[:email],
                      username: params[:username],
                      password: params[:password],
         password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/signup'
    end
  end

  get '/sessions/new' do
    erb :'sessions/login'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      # add an error message
      erb :'sessions/login'
    end
  end

  get '/peeps' do
    @peeps = Peep.all.reverse!
    erb :'peeps/index'
  end
end
