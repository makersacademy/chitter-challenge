require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './docs/chitter'
require './docs/user'
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

  get '/users/register' do
    erb :"users/register"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/chitter')
    else
      flash[:notice] = 'Please check your username or password.'
      redirect('/')
    end
  end

  post '/users' do
    user = User.create(
      first_name: params['first_name'], 
      surname: params['surname'], 
      email: params['email'], 
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/'
  end
      
  get '/sessions/new' do
    erb :"sessions/new"
  end

  

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end



  # get '/chitter' do
  #   @user = User.find(id: session[:user_id])
  #   @chitter = Chitter.peep_history
  #   erb :chitter
  # end

  # get '/chitter/new' do 
  #   @user = User.find(id: session[:user_id])
  #   erb :new
  # end 

  # post '/chitter' do 
  #   @user = User.find(id: session[:user_id])
  #   Chitter.create(message: params['message'])
  #   redirect '/chitter'
  # end

  # run! if app_file == $0
end
