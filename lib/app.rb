require 'sinatra/base'
require 'sinatra/flash'
require_relative './model/peep'
require_relative './model/user'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/home' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:'/home')
  end

  post '/peep' do
    Peep.create(peep: params[:newpeep])
    redirect '/home'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/home'
    else
      flash[:notice] = 'AUTHENTICATION ERROR: please check your email or password and try again'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'Goodbye!'
    redirect('/')
  end

end
