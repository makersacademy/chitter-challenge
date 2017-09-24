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

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep_text: params[:peep_text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                       user_name: params[:user_name],
                       email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end


end
