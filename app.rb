require 'pg'
require 'sinatra/base'
require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb:'homepage'
  end

  get '/interface' do
    @user = User.find(session[:user_id])
    erb:'interface'
  end

  get '/register/new' do
    erb:'register'
  end

  post '/register' do
  user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
  session[:user_id] = user.id
  redirect '/'
  end


  run! if app_file == $0
end
