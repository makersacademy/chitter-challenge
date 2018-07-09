require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'

# Acts as the controller
class Chitter < Sinatra::Base
  enable :sessions

  # Initial gateway page
  get '/' do
    erb :index
  end

  # Feed of all submitted peeps
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  # New peep form
  get '/peeps/new' do
    redirect '/sessions/new' if session[:user_id].nil?
    erb :'peeps/new'
  end

  # Create new peep in database
  post '/peeps' do
    @peep = Peep.create(params[:content], session[:user_id])
    redirect '/peeps'
  end

  # Logged-in user homepage
  get '/users' do
    @user = User.retrieve(session[:user_id])
    erb :'users/index'
  end

  # New user form
  get '/users/new' do
    erb :'users/new'
  end

  # Create new user in database, start new session
  post '/users' do
    @user = User.create(params[:username], params[:name], params[:email],
            params[:password])
    session[:user_id] = @user.id
    redirect '/users'
  end

  # Login form
  get '/sessions/new' do
    erb :'sessions/new'
  end

  # Authenticate login information, start new session
  post '/sessions' do
    user = User.authenticate(params[:sign_in_email], params[:sign_in_password])
    session[:user_id] = user.id
    redirect '/users'
  end

  # Clear session information
  post '/sessions/destroy' do
    session.clear
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
