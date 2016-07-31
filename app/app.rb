ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class ChitterChallenge < Sinatra::Base

enable :sessions

  get '/' do
    erb :'peeps/home'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/sign_up'
  end

  post '/user' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
