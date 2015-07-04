require 'sinatra/base'
require 'sinatra/flash'

require './app/models/user'
require './app/models/peep'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  register Sinatra::Flash

  set :sessions_secret, 'super secret'

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    if current_user
      peep = Peep.new(message: params[:peep], username: current_user.username)
      peep.save
      redirect '/peeps'
    else
      flash[:notice]='Please sign in first'
      redirect '/sessions/new'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['Incorrect username and/or password']
      redirect to('/sessions/new')
    end
  end

  delete '/sessions' do
    flash[:notice] = 'Goodbye!'
    session[:user_id] = nil
    redirect '/'
  end

  helpers do
    def current_user
      @user||=User.get session[:user_id]
    end
  end
  # LEARN HOW TO DO THIS. THIS GIVES ACCESS TO THE USER FOR WELCOME AFTER SIGN_UP
end
