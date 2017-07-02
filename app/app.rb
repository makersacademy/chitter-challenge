ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'dm_init'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret,  'super secret'
  register Sinatra::Flash
  
  get '/peeps/index' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    @creators = @peeps[0]
    p @creators
    erb :'peeps/index'
  end
  
  post '/peeps/new' do
    Peep.create(content: params[:content], user_id: new_user.id)
    session[:last_peep] = params[:content]
    redirect '/peeps/index'
  end
  
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end
  
  post '/users/new' do
    @user = User.new(
    email: params[:email],
    password: params[:password],
    name: params[:name],
    user_name: params[:user_name],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_name] = @user.user_name
      redirect '/peeps/index'
    else
      @errors = @user.errors
      erb :'users/new'
    end
  end
  
  helpers do
    def new_user
      @new_user ||= User.first(user_name: session[:user_name])
    end
    
    def get_user_name(id)
      user = User.get(id)
      user.user_name
    end
    
  end
  
end
