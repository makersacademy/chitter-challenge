ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
use Rack::MethodOverride
enable :sessions
set :session_secret, 'super secret'
register Sinatra::Flash

  get '/' do
    erb :'peeps/home'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
  @user = User.create(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    flash.now[:bad] = "Your passwords don\'t match"
    erb :'/users/sign_up'
  end
end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
