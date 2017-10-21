ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/infrastructure' do
    'infrastructure working'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/feed' do
    Peep.create(contents: params[:peep], time: Time.now)
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all.reverse
    erb :feed
  end

  get '/users/new' do
    erb :'users/new_user'
  end

  post '/users/new' do
    User.create(email: params[:user], password: params[:password])
    session[:user_id] = User.last.id
    redirect '/users/confirmation'
  end

  get '/users/confirmation' do
    @user = User.last
    erb :'users/confirmation'
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id])
    end
  end
end
