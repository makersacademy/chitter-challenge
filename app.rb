require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers/helper'

class Chitter < Sinatra::Application

  enable :sessions
  set :session_secret, 'super_secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @peeps = Peep.all
    @users = User.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post "/users" do
  @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:checkpassword])
    if @user.save
      session[:user_id] = @user.id
      redirect "/peeps"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :created_at.desc ])
    erb :'peeps/index'
  end

  post '/peeps/new' do
    owner = current_user
    #owner.peeps << Peep.create(content: params[:content])
    owner.peeps.create(content: params[:content])
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    email = current_user.email
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye #{email}"
    redirect '/peeps'
    erb :'peeps/index'
  end

end
