require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    Peep.add(params[:message])
    redirect '/'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    user = User.create(params[:email], params[:password], params[:name], params[:username])
    p user
    session[:id] = user.id
    redirect '/'
  end

end
