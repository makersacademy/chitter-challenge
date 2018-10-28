require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user'
require_relative './database_connection_setup'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], peep_timestamp: Time.now)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  run! if app_file == $0
end
