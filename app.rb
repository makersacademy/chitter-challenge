require "sinatra/base"
require "./lib/peep"
require "./lib/timeline"
require "./lib/user"
require "./lib/database"
require "rack"
require "sinatra/flash"

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :method_override, true

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Timeline.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/users' do
    # create the user and then...
    user = User.create(
      email: params['email'],
      password: params['password'],
      realname: params['firstname'],
      username: "@" + params['username']
    )
    session[:user_id] = user.id

    redirect :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])

    if user
      session[:user_id] = user.id
      flash[:notice] = 'Welcome to chitter!.'
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  run! if app_file == $PROGRAM_NAME

end
