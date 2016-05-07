ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/user'

require_relative 'data_mapper_setup'



class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/sign_up' do
    erb :'users/user_sign_up_form'
  end


  post '/usercreate'do
    user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/confirm'
  end


  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end


 get '/confirm' do
   erb :'users/sign_up_confirmation'

 end
     run! if app_file == $0


 end

