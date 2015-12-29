ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user/new' do
    @user = User.create(user_name: params[:user_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
