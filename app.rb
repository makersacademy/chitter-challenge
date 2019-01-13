require 'sinatra/base'
require './lib/user'
require './lib/peep'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  enable :sessions
  enable :method_override

  get '/' do
    @user = User.get(session[:user_id])
    @peep = Peep.all
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(content: params[:peep], user: current_user)
    redirect '/profile'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username])

    if user.valid?
      session[:user_id] = user.id
      redirect "/profile"
    elsif params[:password].length < 6
      redirect 'error_page'
    else
      redirect 'error_page'
    end
  end

  get '/profile' do
    if signed_in?
      user = User.get(session[:user_id])
      @peep = Peep.all
      erb :profile
    else
      redirect 'login'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/'
    end
  end

  get '/error_page' do
    erb :error_page
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end
