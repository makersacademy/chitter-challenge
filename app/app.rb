require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'helpers'



class ChitterWeb < Sinatra::Base

  include Helpers

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :'peeps'
  end

  get '/kill' do
    session.clear
    erb :'peeps'
  end

  get '/users/new' do
    erb :'new_users'
  end

  post '/users/new' do
  user = User.new(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
    session[:user_id] = user.id
    redirect to('/')
    else
    flash.now[:errors] = user.errors
    erb :'new_users'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end



run! if app_file == $0
end
