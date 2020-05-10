require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :home
  end

  get '/peeps' do
    @peep = Peep.all
    @user = User.find(id: session[:userid])
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
    user = User.authenticate(email: params[:email], password: params[:password])
    if !user
      flash[:notice] = "Email and/or password do not match"
      redirect '/sessions/new'
    else
      session[:userid] = user.id
      redirect '/peeps'
    end
  end

  run! if app_file == $0
end
