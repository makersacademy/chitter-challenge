require 'sinatra/base'
require 'sinatra/flash'
require './lib/db_connection'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  before do
    DbConnection.check_env
    @peeps = Chitter.all_peeps
    @users = Chitter.all_users
    @user = User.find(session[:user_id])
  end

  get '/' do
    redirect '/chitter/index'
  end

  get '/chitter/index' do
    erb :'chitter/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end
 
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new_user(params[:username], params[:password], params[:email])
    case user
    when 1
      flash[:notice] = 'Ensure your password is at least 8 characters long'; redirect '/users/new'
    when 2
      flash[:notice] = 'That username is already in use, please try another.'; redirect '/users/new'
    when 3
      flash[:notice] = 'That email address is already in use.'; redirect '/users/new'
    else
      session[:user_id] = user.user_id; redirect '/chitter/index'
    end
  end

  post '/sessions' do
    user = User.sign_in(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.user_id
      redirect '/chitter/index'
    else
      flash[:notice] = 'Ensure you have correctly entered your username and password.'
      redirect 'sessions/new'
    end
  end
  
  post '/chitter/peep' do
    Peep.new_peep(params[:message], @user.user_id)
    redirect '/chitter/index'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have successfully signed out!'
    redirect '/chitter/index'
  end

  run! if app_file == $0
end
