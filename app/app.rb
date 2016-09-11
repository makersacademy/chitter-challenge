require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup.rb'

class ChitterApp < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/users/new' do
     @error_msg = flash[:notice]
     @current_email = session[:user_email]
     erb :'users/new'
   end

   post '/users' do
     user = User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
     session[:user_id] = user.id
     session[:user_email] = params[:email]
     if user.save
       redirect '/chits'
     else
       flash[:notice] = user.errors.full_messages.join(", ")
       redirect '/users/new'
     end
   end

   get '/users/signin' do
     @error_msg = flash[:notice]
     erb :'users/signin'
   end

   post '/users/signin' do
     user = User.check_password(params[:email], params[:password])
       if user
       session[:user_id] = user.id
       redirect '/links'
       else
       flash[:notice] = ['Username or password is not correct']
       redirect '/users/signin'
       end
     end

     get '/users/signout' do
       session.clear
       flash[:notice] = ['Goodbye!']
       redirect '/links'
     end


  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

    run! if app_file == $0
  end
