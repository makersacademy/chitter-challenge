require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user.rb'
require_relative './lib/peep.rb'
require_relative './database_connection_setup.rb'

# Chitter class
class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    if session[:username]
      @user = User.find(column: 'username', value: session[:username])
    end
    @peeps = Peep.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users' do
    user = User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password])
    case user
    when User::USERNAME_ALREADY_IN_USE
      flash[:notice] = 'Username already in use!'
      redirect('/users/new')
    when User::EMAIL_ALREADY_IN_USE
      flash[:notice] = 'Email already in use!'
      redirect('/users/new')
    else
      session[:username] = user.username
      redirect('/')
    end
  end

  get '/users/:username/peeps/new' do
    @username = params[:username]
    erb :'peeps/new'
  end

  post '/users/:username/peeps' do
    username = session[:username]
    user = User.find(column: 'username', value: "#{username}")
    Peep.create(text: params[:peep_text], user_id: user.id)
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username],
      password: params[:password])
    if user
      session[:username] = user.username
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have logged out.'
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
