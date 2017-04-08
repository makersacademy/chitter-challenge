ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
# require_relative 'models/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super_secret'


  get '/' do
    erb :'/index'
  end

  get '/user/new' do
    @user = User.new
    erb :'/user/new'
  end

  post '/user' do
    @user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect to('/')
    else
      flash.now[:error] = "Passwords didn't match, please try agian"
      erb :'/user/new'
    end

  end


end
