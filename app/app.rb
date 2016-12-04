ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './models/user'
require 'pry'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :first_page
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/login/new' do
    erb :login
  end

  post '/login' do
    @user = User.authenticate(params[:username],params[:password])
    if @user
      erb :user
    else
      redirect 'login/new'
    end
  end

  post '/users' do
    @user = User.new(email: params[:email], name: params[:name], password: params[:password], username: params[:username])
    if @user.save
      erb :user
    else
      flash[:errors] = @user.errors.full_messages.join(" ")
      redirect '/sign_up'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
