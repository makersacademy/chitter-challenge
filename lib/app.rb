require_relative 'peep_manager'
require_relative 'user'
require_relative 'database_connection_setup'
require 'sinatra'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  post '/peeps/new' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/user/new' do
    erb :'user/registration'
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  run! if app_file == $0
end
