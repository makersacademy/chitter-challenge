ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/datamapper'
require 'pry'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/profile' do
    if signed_in?
      @peeps = Peep.all
      erb :profile
    else
      redirect '/login'
    end
  end

  post '/profile' do
    session[:tag_someone] = params[:tag_someone]
    Peep.create(content: params[:content], time: Time.now, user: current_user)
    if User.first(username: session[:tag_someone])
      User.first(username: session[:tag_someone])
    end
    redirect '/profile'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password],
      name: params[:name], username: params[:username])
    if user.valid?
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/'
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
