ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
enable :sessions

  get '/' do
    erb :'peeps/home'
  end

  get '/users/new' do
    @user = User.new
    erb :'user/sign_up'
  end

  post '/users' do
  @user = User.create(name: params[:name],
                    email: params[:email],
                    password: params[:password])
    session[:user_id] = @user.id
    redirect '/'
end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
