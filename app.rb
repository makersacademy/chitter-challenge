require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb(:'chitter/index')
  end

  post '/chitter/new-peep' do
    Peep.create(peep: params[:peep], time: 'now')
    redirect '/chitter'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password],
      name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/chitter'
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chitter'
    else
      flash[:warning] = 'Please check your email or password!'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out!'
    redirect '/chitter'
  end

  run! if app_file == $0
end
