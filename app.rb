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
    @user = User.find(id: session[:user_id])
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
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id.to_i
    p session[:user_id]
    redirect '/peeps'
  end

  run! if app_file ==$0

end
