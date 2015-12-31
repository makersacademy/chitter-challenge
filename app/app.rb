ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/flash'

require_relative 'server'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to('/messages')
      else
        flash.now[:errors] = @user.errors
        erb :'users/new'
      end
  end

  post '/sessions' do
    user = User.authenticate(params[:existing_username], params[:existing_password])
    if user
      session[:user_id] = user.id
      redirect to('/messages')
    else
      flash.now[:errors] = [['The email or password is incorrect']]
      erb :'users/new'
    end
  end

  delete '/sessions' do
      session[:user_id] = nil
      flash.keep[:notice] = 'Goodbye'
      redirect to '/users/new'
  end

  get '/messages' do
    erb :'messages/index'
  end

end
