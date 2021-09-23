require 'pg'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require './db_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions, :method_override
  
  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/user/new' do
    erb :sign_up
  end
  
  post '/user/new' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end
  
  post '/session/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      redirect '/'
    end
  end

  

  run! if app_file == $0
end
