ENV['RACK_ENV'] ||= "dev"

require 'sinatra/base'
require 'sinatra/flash'
require './app/datamapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash

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
      redirect "/users/#{user.handle}"
    else
      flash.next[:pwd] = 'Passwords don\'t match' unless params[:pwd] == params[:pwd_confirm]
      flash.next[:handle] = "Handle is taken" if User.first(handle: params[:handle])
      flash.next[:email] = "Handle is taken" if User.first(email: params[:email])
      redirect '/users/new'
    end
  end

  run! if app_file == $0
end