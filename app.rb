require 'sinatra/base'
require 'sinatra/flash'
require_relative 'database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :public_folder, proc { File.join(root, 'static') }

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    @user = User.find(session[:user_id])
    Peep.create(content: params[:peep], user: @user)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name],
                       username: params[:username])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions'
    end
  end

  get '/sessions' do
    erb :'sessions/index'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps')
  end

  run! if app_file == $0
end
