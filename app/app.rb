ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Welcome to Heather\'s Chitter'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/user/new' do
    @user = User.new
    erb :new
  end

  post '/user/new' do
    @user = User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    redirect '/'
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect '/'
    # else
    #   redirect '/user/new'
    #   # flash.now[:errors] = @user.errors.full_messages
    #   # erb :'links/signup'
    # end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
