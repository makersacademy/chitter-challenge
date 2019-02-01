require 'sinatra/base'
require './lib/peeps'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    @user = session[:user]
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new' 
  end


  post '/peeps' do
    Peep.add(peep: params[:new_peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    session[:user] = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/peeps'
  end

  run! if app_file ==$0

end
