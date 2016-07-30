ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello Chitter!'
  end

  get '/users/sign_up' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users/sign_up' do
    @user = User.create(username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation]
               )
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps/feed'
    else
      flash.now[:error] = 'Passwords provided do not match.
                       Please provide matching passwords
                       and click sign up again'
      erb :'/users/sign_up'
    end
  end

  get '/peeps/feed' do
    erb :'peeps/feed'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
