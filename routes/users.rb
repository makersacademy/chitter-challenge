require 'sinatra/base'
require_relative '../lib/repositories/user_repository'
require_relative '../lib/repositories/peep_repository'

class Users < Sinatra::Base
  enable :sessions
  set :session_secret, "5cdde102f6f68294e1cff23f341aaaaf2d2725453eaccc8ebc239629e724fc53"

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]

    UserRepository.create(name, username, email, password)

    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    user = UserRepository.authenticate(email, password)

    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/login'
    end
  end

  get '/profile' do
    if logged_in?
      @user = current_user
      @peeps = PeepRepository.find_by_user(@user.id)
      erb :profile
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  private

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    UserRepository.find(session[:user_id])
  end
end
