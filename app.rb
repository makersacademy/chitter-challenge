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
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps/new' do
    Peep.add(content: params[:New_peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do 
    user = User.create(email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username])
    session[:user_id] = user.id
    redirect '/peeps'
  end
end
