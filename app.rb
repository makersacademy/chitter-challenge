require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new/submit' do
    Peep.create(params[:author],params[:handle],params[:content])
    redirect '/peeps'
  end

  get '/signup' do
    erb :signup
  end
  
  post '/signup/new' do
    User.create(params[:author],params[:handle],params[:email], params[:password])
    @user = User.find(session[:author])
    redirect 'signup/confirmation'
  end

  get '/signup/confirmation' do
    erb :confirmation
  end

  run! if app_file == $0
end
