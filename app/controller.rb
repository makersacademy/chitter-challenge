ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  use Rack::MethodOverride

  get '/' do
    erb :home
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
      redirect '/cheeps/index'
    else
      flash.now[:errors]=@user.errors.full_messages
      erb :'users/new'
    end

  end

  get '/cheeps/index' do
    erb :'cheeps/index'
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
      redirect '/cheeps/index'
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

end
