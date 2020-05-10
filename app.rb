require 'sinatra/base'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'
require 'rack_session_access'

class Chitter < Sinatra::Base

  enable :sessions
  # Rack session access for testing with session values
  use RackSessionAccess::Middleware if environment == :test
  # Flash for messages to user
  register Sinatra::Flash

  get '/' do
    'Hello World!'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/peeps/new' do
    Peep.create(author: session[:username], content: params[:content])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    #saving user id & username in sessions so they can be referenced on /peeps/new and /peeps routes.
    session[:user_id] = user.id
    session[:username] = user.username
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    #saving user id & username in sessions so they can be referenced on /peeps/new and /peeps routes.
    session[:username] = params[:username]
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = "Your username or password is incorrect."
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out."
    redirect '/peeps'
  end

  run! if app_file == $0
end
