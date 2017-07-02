ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/peep.rb'
require_relative './models/user.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :'links/index'
  end

  post '/peeps/new' do
    peep = Peep.create(content: params[:new_peep], creator: User.current_user(session[:user_id]).username)
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :'links/add_peep'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       name: params[:name],
                       username: params[:username],
                       password: params[:password],
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
