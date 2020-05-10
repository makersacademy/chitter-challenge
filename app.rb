require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :home
  end

  get '/peeps' do
    @peep = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    redirect '/peeps'
  end

  run! if app_file == $0
end
