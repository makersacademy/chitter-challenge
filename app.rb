require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/chitter'
require './lib/user'
require './database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
    set :server, :thin
  end

  get '/' do
    erb :index
  end

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    @chitter = Chitter.all
    erb :chitter, :layout => :main_layout
  end 

  get '/chitter/new' do 
    @user = User.find(id: session[:user_id])
    erb :new, :layout => :main_layout
  end 

  post '/chitter' do 
    @user = User.find(id: session[:user_id])
    Chitter.create(post: params['post'], author_id: session[:user_id], author_email: @user_email, author_name: @user.name)
    # @user_email = @user.email
    redirect '/chitter'
  end

  get '/users/new' do
    erb :"users/new", :layout => :main_layout
  end
  
  post '/users' do
    user = User.create(email: params[:email], name: params[:name], password: params[:password])
    session[:user_id] = user.id
    redirect '/chitter'
  end

  get '/sessions/new' do
    erb :"sessions/new", :layout => :main_layout
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/chitter')
    else 
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have successfully signed out.'
    redirect('/chitter')
  end

  get '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have successfully signed out.'
    redirect('/chitter')
  end

  run! if app_file == $0
end
