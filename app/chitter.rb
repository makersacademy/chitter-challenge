require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/peep'
require './scripts/setup_db'
require './lib/user'


class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions

  get '/' do 
    redirect '/peeps'
  end

  post '/users/new' do
    user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    redirect '/'
  end

  post '/sessions/new' do
    params['type'] == 'login' ? erb(:'sessions/login'): erb(:'sessions/signup')
  end

  get '/sessions/new/login' do
    erb(:'sessions/login')
  end

  post '/sessions' do
    user = User.authenticate(user: params[:user], password: params[:pass])
    
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check your email or password'
      redirect '/sessions/new/login'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have logged out."
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find_id(session[:user_id]) if session[:user_id]
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/peeps/new' do
    erb :'peep/new_peep'
  end

  post '/peeps/new' do

    message = Peep.create(user_id: session[:user_id], peep: params[:peep])

    redirect '/peeps'
  end

  #run! if app_file = $0
end