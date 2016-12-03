require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'pry'

ENV['RACK_ENV'] ||= 'development'

class ChitterManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'hashy_ha_ho_ha'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.new(params)
    user.save
    session[:current_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    user = current_user
    @user_first_name = user ? user.name.split(" ")[0] : ""
    erb :'peeps/index'
  end

  get '/sessions/new' do
    erb :'users/sign_in'
  end

  post '/sessions/new' do
    user = User.authenticate params[:username],
                            params[:password]
    binding.pry
    redirect '/peeps' if user
    redirect '/sessions/new'
  end

  helpers do
    def current_user
      User.get session[:current_id]
    end
  end
end
