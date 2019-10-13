require 'sinatra'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  get '/index' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/new' do
    erb :'peeps/new'
  end

  post '/index' do
    Peep.create(text: params['peep'], time: Time.new.strftime("%m/%d/%Y %I:%M %p"))
    redirect '/index'
  end

  get '/new_user' do
    erb :"users/new_user"
  end
  
  post '/users' do
    user = User.create(user_name: params[:user_name], password: params[:password])
    session[:user_id] = user.id
    redirect '/index'
  end

  run! if app_file == $0
end
