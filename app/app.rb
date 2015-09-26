require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/helpers/user_helper'
require 'sinatra/flash'

class App < Sinatra::Base
  helpers UserHelpers
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    current_user
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                    name: params[:name],
                    nickname: params[:nickname],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash[:notice] = 'Email or password is invalid'
      redirect to '/sessions/new'
    end
  end
end
