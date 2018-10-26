require 'sinatra/base'
# require 'pg'
require './lib/peep'
require './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    # p "user:"
    # p session[:user_id]
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/peep/new' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/user/register' do
    erb :register
  end

  post '/user/new' do
    user = User.create(params[:firstname], params[:lastname],
        params[:username], params[:password], params[:email])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0

end
