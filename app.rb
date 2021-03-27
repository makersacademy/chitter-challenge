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
    erb :index
  end

  get '/create_account' do
    erb :create_account
  end

  post '/new_user' do
    user = User.new_user(params[:username], params[:password], params[:email])
    session[:user_id] = user.user_id
    redirect '/:user_id'
  end

  get '/:user_id' do
    @user = User.find(session[:user_id])
    @peeps = Chitter.all_peeps
    @users = Chitter.all_users
    erb :chitter
  end
  
  post '/:user_id/peep' do
    Peep.new_peep(params[:message], session[:user_id])
    redirect '/:user_id'
  end

  run! if app_file == $0
end
