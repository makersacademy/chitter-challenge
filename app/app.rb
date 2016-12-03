ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash

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
    erb :signup
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
      flash.now[:password_error] = "Password and confirmation do not match"
      puts "here"
      erb :signup
    end
  end

  get '/users/login' do
    erb :login
  end

  post '/users/login_successful' do
    @user = User.first(username: params[:username])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
