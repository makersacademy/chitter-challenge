ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :"sign_up"
  end

  post '/sign-up' do
    @user = User.create(username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    session[:user_id] = @user.id
    redirect to('/chitter_feed')
  end

  get '/chitter_feed' do
    erb :chitter_feed
  end

  run! if app_file == $0
end
