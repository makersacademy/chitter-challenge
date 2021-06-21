require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require './lib/chitter'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Flash
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/users' do
    erb :'new'
  end
  
  post '/users/new' do
    user = Chitter.setup_user(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions' do
    erb :"sessions"
  end

  post '/sessions/new' do
    user = Chitter.authenticate_user(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions')
    end
  end

  get '/' do
    @user = Chitter.find_user(id: session[:user_id])
    @peeps = Chitter.all_peeps
    erb :'index'
  end

  post '/peep' do
    Chitter.create_peep(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end