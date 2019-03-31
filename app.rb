require 'sinatra/base'
require './models/peep.rb'
require './models/user.rb'

# Chitter class
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all_peeps
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(message: params[:Message])
    redirect '/peeps'
  end

  get '/registration/signup' do
    erb :'/registration/signup'
  end
  
  post '/registration' do
    user = User.create(fullname: params[:fullname], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end