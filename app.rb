require 'sinatra/base'
require 'shotgun'
require 'pg'
require './lib/user.rb'

class Chitter < Sinatra::Base

enable :sessions, :method_override

  get '/' do
    'Welcome to CHITTER!'
  end

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])

    redirect '/users'
  end

run! if app_file == $0

end
