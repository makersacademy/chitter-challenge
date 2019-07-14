require './lib/peep'
require './lib/user'
require './scripts/setup_db.rb'
require 'sinatra/flash'
#require 'compass'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id]) if session[:user_id]
    @peeps = Peep.all
    erb :index
  end

  post '/peeps/create' do 
    Peep.create(user_id: session[:user_id], peep: params['peep'])
    redirect '/'
  end

  post '/users/create' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/sessions/create' do
    if params['type'] == 'Log In'
      erb :'sessions/login'
    else
      erb :'sessions/signup'
    end
  end

  get '/sessions/create/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'The username and password that you entered did not match our records. Please double-check and try again.'
      redirect '/sessions/create/login'
    end
  end

  get '/peeps/create' do
    erb :'peeps/create'
  end

  post '/peeps/create' do
    peep = params[:peep]
    user_id = session[:user_id]
    Peep.create(user_id: user_id, peep: peep)
    redirect '/peeps'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have logged out"
    redirect '/peeps'
  end

  run! if app_file == $0
end
