ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'dm_init'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/peeps/index' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :'peeps/index'
  end
  
  post '/peeps/new' do
    Peep.create(content: params[:content])
    session[:last_peep] = params[:content]
    redirect '/peeps/index'
  end
  
  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users/new' do
    User.create(email: params[:email], password: params[:pasword], name: params[:name], user_name: params[:user_name])
    session[:user_name] = params[:user_name]
    redirect '/peeps/index'
  end
  
  helpers do
    def new_user
      @new_user ||= User.first(user_name: session[:user_name])
    end
    
  end
  
end
