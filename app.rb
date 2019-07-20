require 'sinatra/base'
require_relative './models/peep'
require_relative './models/user'
require 'sinatra/flash'
# require_relative './models/chitter'

class ApplicationManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:username])
    @peeps = Peep.all
    erb(:index)
  end

  post '/post-peep' do
    @user = User.find(session[:username])
    Peep.add(params[:peep], @user.username)
    redirect '/'
  end

  get '/users' do
    erb(:users)
  end

  post '/users/new' do
    if User.check_username(params[:username])
      flash[:notice] = 'username already taken'
      redirect('/users')
    elsif User.check_email(params[:email]) 
      flash[:notice] = 'email already taken'
      redirect('/users')
    else
      user = User.add(params[:username], params[:email], params[:password])
      session[:username] = user
      redirect '/'
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:username] = user
      redirect '/'
    else
      flash[:notice] = 'Please check your email or password'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect('/')
  end

  run! if app_file == $0

end