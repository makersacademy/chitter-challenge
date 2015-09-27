require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helper/current_user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  include Helpers

  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'index'
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
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    @user = User.new
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
    end
  end

  delete '/sessions' do
    flash.now[:notice] = ["goodbye!"]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
