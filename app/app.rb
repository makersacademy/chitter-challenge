ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './data_mapper_setup'
require './app/models/user'
require 'sinatra/flash'
require './app/models/peep'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
  @user = User.create(
    email: params[:email],
    name: params[:name],
    username: params[:username],
    password: params[:password],
    password_confirmation: params[:password_confirmation])

    # if @user.password.nil?
    #   flash.now[:errors] = @user.errors.full_messages
    #   erb :'users/new'
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email],
                          params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps/new')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    username = current_user.username
    name = current_user.name
  Peep.create(
  title: params[:title],
  body: params[:body],
  created_at: Time.now,
  username: username,
  name: name)
  redirect to ('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
  erb :'peeps/index'
  end


  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end

  end


  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
