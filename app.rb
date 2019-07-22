require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './lib/database_connection_setup'
require './lib/database_connection'


class Chitter < Sinatra::Base

  enable :session
  
  get '/' do
    erb :index
  end

  get '/peep/new' do
    erb :'new_peep'
  end

  post '/peep' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    @user = User.find(id: session[:user_id])
    erb :'peeps'
  end

  get '/user/new' do
    erb :'new_user'
  end

  post '/user' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    p user
    p user.id
    session[:user_id] = user.id
    redirect '/peeps'
  end


  run! if app_file == $0
end
