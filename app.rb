require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.find(id: session[:user_id])
    end
  end

  get '/' do
    erb :home
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(post: params[:peep], poster: current_user.handle, poster_name: current_user.name)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      handle: params[:handle], 
      email: params[:email], 
      password: params[:password], 
      name: params[:name]
    )

    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = "Email or handle is taken. Please try another"
      redirect '/users/new'
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = "Please check your email or password."
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/peeps'
  end

  run! if app_file == $0
end
