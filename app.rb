require 'sinatra/base'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions
  
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
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{params[:username]}'")
    user = User.create(name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
    session[:username] = user.username
    session[:user_id] = user.id
    redirect '/'
  end


end