ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'dm-validations'
require 'sinatra/flash'
require_relative '../data_mapper_setup'
require_relative 'models/user'

class ChitterChallenge < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect('users/new')
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  post '/users' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
    p 'if'
     session[:user_id] = @user.id
      redirect to('/peeps/new')
      erb :'users/new'
    else
    p 'else'
    flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end


  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end


  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:user] = params[:email]
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    session[:user] = nil
    flash.next[:notice] = 'goodbye!'
    redirect to('/sessions/new')
  end
    run! if app_file == $0
end
