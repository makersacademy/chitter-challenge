require 'sinatra/base'
require './lib/db_connection'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  enable :sessions

  before do
    DbConnection.check_env
    @peeps = Chitter.all_peeps
    @users = Chitter.all_users
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
    session[:user_id] = user.user_id
    redirect '/chitter/index'
  end

  post '/sessions' do
    user = User.sign_in(username: params[:username], password: params[:password])
    @user = User.find(session[:user_id])
    @peeps = Chitter.all_peeps
    @users = Chitter.all_users
    redirect '/chitter/index'
  end
  
  post '/chitter/peep' do
    Peep.new_peep(params[:message], session[:user_id])
    redirect '/chitter/index'
  end

  run! if app_file == $0
end
