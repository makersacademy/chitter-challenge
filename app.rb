require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'pg'
# require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @user = session[:user_id] ? User.find(session[:user_id]) : nil 
    @peeps = Peep.all.order(created_at: :desc)
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    new_user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      user_name: params[:user_name],
      password: params[:password],
    )
    session[:user_id] = new_user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    session[:user_id] = User.log_in(email: params[:email],password: params[:password])
    redirect '/'
  end
end
