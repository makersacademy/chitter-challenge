require 'sinatra/base'
require 'sinatra/activerecord'
require_relative './models/user'

class Chitter < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions

  get '/' do
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/register' do
    @user = User.create(
      username: params['username'],
      email: params['email'],
      encrypted_password: params['encrypted_password']
    )
    session[:user_id] = @user.id
    redirect '/'
  end

  run! if app_file == $0
end
