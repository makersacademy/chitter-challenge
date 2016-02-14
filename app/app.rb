ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative '../data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                name: params[:name],
                user_name: params[:user_name],
                passwordconf: params[:passwordconf])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/welcome')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :sign_up
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/welcome' do
    erb :home
  end



  run! if app_file == $0
end
