ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= p User.get(session[:user_id])
    end
  end

  get '/home' do
    @users = User.all
    erb :feed
  end

  get '/sign-up' do
  erb :'users/new', :layout => false
  end

  post '/sign-up' do
    p user = User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to '/home'
  end



  run! if app_file == $0
end
