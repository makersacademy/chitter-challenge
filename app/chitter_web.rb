ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './app/datamapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/users/:handle' do
    @user = User.first(handle: params[:handle])
    erb :'users/index'
  end

  post '/users' do
    user = User.create(name: params[:name],
                email: params[:email],
                handle: params[:handle],
                password: params[:pwd],
                password_confirmation: params[:pwd_confirm])
    if user.save
      session[:user_handle] = user.handle
      redirect "/users/#{user.handle}"
    else
      flash.next[:pwd] = 'Passwords don\'t match' unless params[:pwd] == params[:pwd_confirm]
      flash.next[:handle] = 'Handle is taken' if User.first(handle: params[:handle])
      flash.next[:email] = 'Email is taken' if User.first(email: params[:email])
      redirect '/users/new'
    end
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:pwd])
    if user
      session[:user_handle] = user.handle
      redirect "/users/#{user.handle}"
    else
      flash.next[:sign_in] = 'The email or password is incorrect'
      redirect '/'
    end
  end

  delete '/sessions' do
    session[:user_handle] = nil
    flash.next[:sign_out] = 'You have signed out'
    redirect '/'
  end

  run! if app_file == $0
end