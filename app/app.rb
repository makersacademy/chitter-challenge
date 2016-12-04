ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users/create' do
    @user = User.create(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      name: params[:name],
      username: params[:username]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  get '/peeps' do
    erb :'/peeps/peeps'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Log out successful. See you soon!"
    redirect to '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
