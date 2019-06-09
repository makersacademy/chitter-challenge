require 'sinatra/base'
require './models/user'
require './db/database'

class Chitter < Sinatra::Base
  enable :sessions
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
    @peeps = Peep.all
    @user_name = session[:user_name]
    erb :"peeps/index"
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    Database.setup
    result = Database.query("SELECT * FROM users WHERE email = '#{params[:username]}'")
    user = User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])   
    session[:user_name] = user.name
    redirect('/chitter/feed')
  end

  
end