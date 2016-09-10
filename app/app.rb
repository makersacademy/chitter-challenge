require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    "Welcome"
  end

  get '/users/signup' do

    erb :'users/signup'
  end

  post '/users/signup' do

    user = Users.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      session[:user_name] = user.name

      redirect '/'
    else
      flash[:error] = user.errors.full_messages.join(", ")

      redirect '/users/signup'
    end

  end

  get '/users/signin' do

    erb :'/users/signin'
  end

  post '/users/signin' do
    user = Users.signin(params[:username],params[:password])
      unless user.nil?
        session[:user_id] = user.id
        session[:user_name] = user.name

        redirect '/'
      else
        flash[:error] = 'Wrong username or/and password.'
        redirect '/users/signin'
      end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
