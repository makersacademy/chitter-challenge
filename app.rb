require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative 'lib/chitter'
require_relative 'lib/user'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions

  get ('/') do
    erb :index
  end

  get ('/users/new') do
    erb :users
  end

  post ('/users') do
    user = User.create(email: params[:email], password: params[:password], username: params[:username] )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get ('/peeps') do
    @user = User.find(id: session[:user_id])
    @peeps = Chitter.all
    erb :peeps
  end

  get ('/peeps/new') do
    erb :new
  end

  post ('/peeps') do
    Chitter.create(text: params[:text])
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sign_in'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Email or password incorrect, please try again'
      redirect '/sessions/new'
    end
  end

  run! if app_file == $0
end