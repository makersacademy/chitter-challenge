ENV["RACK_ENV"] = "development"



require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/user'

require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb(:"links/home")
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                       password: params[:password],
                       email: params[:email],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/links')
    else
      flash.next[:error] = "Password and confirmation password do not match"
      redirect('/users/new')
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
