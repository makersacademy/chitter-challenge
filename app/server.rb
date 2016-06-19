require 'sinatra/flash'
require_relative './models/users'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    Chitter
  end

  get '/users/new' do
    @user = Users.new
    erb :'users/new'
  end

  post '/users' do
    @user = Users.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/log_in' do
    erb :'users/log_in'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  helpers do
    def current_user
      current_user ||= Users.get(session[:user_id])
    end
  end

  run! if app_file == $0
end