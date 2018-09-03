require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require './lib/peep'
require './lib/account'
require './setup_database_connection'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = session[:user]
    @peeps = Peep.all
    erb :index
  end

  get '/signin' do
    erb :signin
  end

  post '/setuser' do
    session[:user] = Account.create(params[:name], params[:username], params[:password])
    session[:user_id] = session[:user].account_id
    p params
    p session
    redirect '/'
  end

  get '/compose' do
    erb :compose
  end
  
  post '/peep' do
    @content = params[:peep]
    @author_id = session[:user_id]
    Peep.create_peep(@content, @author_id)
    redirect '/'
  end

  run! if app_file == $0
  
end
