require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/chitter'
require_relative 'lib/user'
require 'sinatra/flash'

class ChitterChallenge < Sinatra::Base

  set :public, 'public'
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Chitter.peeps
    erb(:index)
  end

  post '/' do
    Chitter.post(message: params[:message])
    @peeps = Chitter.peeps
    redirect '/'
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb(:"sessions/new")
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
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

  run! if app_file == $0
end
