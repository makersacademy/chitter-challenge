ENV['RACK_ENV'] ||= 'development'

require_relative './data_mapper_setup.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  before do

  end

  get '/feed' do
    erb(:feed)
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                      password: params[:password],
                      username: params[:username],
                      name: params[:name])
    session[:user_id] = user.id
    redirect to('/feed')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
