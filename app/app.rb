require_relative '../data_mapper_setup'
require_relative './models/peep'
require_relative './models/user'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :welcome
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :timestamp.desc ])
    erb :'peeps/index'
  end

  post '/peeps' do
    timestamp = Time.now
    name = session[:user_name]
    username = session[:user_username]
    Peep.create(text: params[:text], timestamp: timestamp, user_name: name, user_username: username)
    redirect to '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                name: params[:name],
                username: params[:username],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      session[:user_username] = @user.username
      session[:user_email] = @user.email
      redirect to '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.now[:notice] = 'goodbye!'
    erb :'sessions/new'
  end
end