ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'

register Sinatra::Flash
use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

 get '/chitter' do
   erb :index
 end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter')
    else
      error_string = ''
      @user.errors.each_value do |error|
        error_string << "#{error.first} "
      end
      flash.now[:notice] = error_string
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    if User.authenticate(params[:username],
                         params[:password])
      user = User.first(username: params[:username])
      session[:user_id] = user.id
      redirect to('/chitter')
    else
      flash.next[:notice] = 'Wrong password. Please try again.'
      redirect to('/sessions/new')
    end
  end

  delete '/sessions' do
    name = current_user.name
    session.clear
    flash.next[:notice] = "Goodbye, #{name}!"
    redirect to('/sessions/new')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end