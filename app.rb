require 'sinatra/base'
require './lib/peep'
require './lib/users'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/username' do
    session[:username] = params[:username]
    redirect '/feed'
  end

  get '/feed' do
    @username = session[:username]
    @peeps = Peep.all
    erb :feed
  end

  post '/feed' do
    Peep.create(params[:peep], session[:username])
    redirect '/feed'
  end

  get '/signup' do
    erb :signup
  end

  post '/create' do
    session[:username] = params[:username]
    User.create(params[:username], params[:password])
    redirect '/feed'
  end
end
