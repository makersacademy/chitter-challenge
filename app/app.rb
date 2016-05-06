ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/chitter'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  set :public_folder, Proc.new { File.join(root, 'static') }

  enable :partial_underscores

  register Sinatra::Flash
  #

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do 
    erb :'chits/new'
  end

  post '/chits' do
    Chit.create(chitter_post: params[:chitter_post], user: params[:user])
    redirect to('/chits')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                     password: params[:password], 
                     password_confirmation: params[:password_confirmation])

    if @user.save
  session[:user_id] = @user.id
  redirect to('/chits')
else
  flash.now[:errors] = @user.errors.full_messages
  erb :'users/new'
end
  end

  helpers do
    def current_user
   @current_user ||= User.get(session[:user_id])
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/chits')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'goodbye!'
  redirect to '/chits'
end

 get '/users/recover' do
    "Please enter your email address"
  end



  run! if app_file == $0
end
end