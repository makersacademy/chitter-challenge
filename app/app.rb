ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

# Chitterapp Sinatra Base
class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello ChitterApp!'
  end

  get '/users/new' do
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
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
