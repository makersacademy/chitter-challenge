ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Ricker < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  use Rack::MethodOverride

  get '/' do
    if session[:user_id]
     redirect '/rolls/index'
    else
      erb :home
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do #Is new_user_sign_up too verbose?
    name = params[:name]
    username = params[:username]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    email =params[:email]

    @user = User.new(name: name,
                        username: username,
                        password: password,
                        password_confirmation: password_confirmation,
                        email: email)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/rolls/index'
    else
      flash.now[:errors]=@user.errors.full_messages
      erb :'users/new'
    end

  end


  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do

    email = params[:email]
    password = params[:password]
    user = User.authenticate(email,password)
    if user
      session[:user_id] = user.id
      redirect '/rolls/index'
    else
      flash.now[:errors]=['The email or password is incorrect']

      erb :'sessions/new'

    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect '/'
  end

  get '/rolls/new' do
    erb :'rolls/new'
  end

  post '/rolls' do
    text = params[:new_roll]
    id = session[:user_id]
    Roll.create(text: text, user_id: id)
    redirect '/rolls/index'
  end

  get '/rolls/index' do

    @rolls = Roll.all
    erb :'rolls/index'
  end
end
