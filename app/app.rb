ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    @user = User.create(name: params[:name],
                email: params[:email],
                username: params[:username],
                password: params[:password])

    session[:user_id] = @user.id
    redirect '/home'
  end

  get '/home' do
    erb(:home)
  end



  run! if app_file == $0
end
