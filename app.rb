ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
require 'pry'


class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    @messages = Message.all
    current_user
    if logged_in?
      erb :logged_in
    else
      erb :index
    end
  end

  post '/post_msg' do
    Message.create(
      peep: params[:msg],
      username: current_username
    )
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(
      username: params[:username],
      mail: params[:mail],
      password: params[:password]
    )
    session[:userid] = user.id if user
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.auth(params[:username], params[:password])
    session[:userid] = user.id if user
    redirect '/'
  end

  get '/logout' do
    @username = current_user.username
    session.delete(:userid)
    erb :logout
  end

  run! if app_file == $0

  def current_username
    current_user.nil? ? 'unknown' : current_user.username
  end

  private

  def current_user
    @current_user ||= User.get(session[:userid])
  end

  def logged_in?
    !current_user.nil?
  end

end
