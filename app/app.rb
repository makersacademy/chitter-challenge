ENV['RACK_ENV'] ||= 'development'
RACK_ENV = ENV['RACK_ENV']

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/base'
require_relative './models/user'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super_secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :home
  end

  get '/users/new' do
    user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.new(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      erb :'users/new'
  end
end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'sessions/new'
    end
  end


  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye'
    redirect to '/'
end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
