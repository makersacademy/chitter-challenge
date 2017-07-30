ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(name: params[:name], handle: params[:handle], post: params[:post])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email],
                       handle: params[:handle], password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/peeps/new')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
