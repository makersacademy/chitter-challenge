ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require './app/models/user.rb'
require './app/helpers.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.first(id: session[:user_id])
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signupinfo' do
    @user = User.new(email: params[:email],
                       password: params[:password],
                       name: params[:name],
                       username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  run! if app_file == $0
end
