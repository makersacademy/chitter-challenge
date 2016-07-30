ENV['RACK_ENV'] ||= "development"
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_development")

require 'data_mapper'
require_relative './models/user'
require 'sinatra/flash'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb:index
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
  @user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect '/'
      else
        flash.now[:bad] = "Your passwords don\'t match"
        erb :'/user/new'
      end
    end

    get '/sessions/new' do
      erb :'sessions/new'
    end

    post '/sessions' do
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/'
      else
        flash.now[:errors] = "The email or password is incorrect"
        erb :'sessions/new'
      end
    end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
