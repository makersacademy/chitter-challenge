require 'sinatra/base'
require 'sinatra/flash'
require './models/user'
require './db/database'
require './models/peep'
require 'uri'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  #This line stops weird session thing from happening which I don't 100% understand - follow up
  set :session_secret, "My session secret"
  #Homepage
  get '/' do
    erb :index
  end

  #Create new user
  get '/users/new' do
    erb :"users/new"
  end

  #Save user to database
  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/chitter/feed'
  end

  get '/chitter/feed' do
    @user_name = session[:user_name]
    @peeps = Peep.all
    erb :'peeps/feed'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:username], password: params[:password])
    if user
      session[:user_name] = user.name
      redirect('/chitter/feed')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/capybara' do
    erb :capybara
  end

  post '/peeps' do
    Peep.add(params[:peep])
    redirect '/chitter/feed'
  end
end