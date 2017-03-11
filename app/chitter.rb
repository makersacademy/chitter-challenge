ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end

  get '/' do
    'Hello World'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/signup'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
    if @user.valid?
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:message] = @user.errors.full_messages.flatten.join(',')
      redirect '/users/new'
    end
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  run if app_file == $0
end
