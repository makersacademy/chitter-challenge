require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'
require './database_connection_setup'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password],
      name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params['content'])
    redirect '/peeps'
  end

end
