ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

# Chitterapp Sinatra Base
class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Hello ChitterApp!'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.new(
      username: params[:username],
      email: params[:email],
      name: params[:name],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
      # redirect to('/users/new')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
