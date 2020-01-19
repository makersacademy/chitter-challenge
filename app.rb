require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
  get '/' do
    @user = session[:username]
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    @user_id = session[:user_id]
    Peep.create(text: params[:text], user_id: @user_id)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = user.username
    session[:user_id] = user.id
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:username] = user.username
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Incorrect username or password'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have logged out'
    redirect '/'
  end

end
