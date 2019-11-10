require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    redirect '/index'
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/newuser' do
    erb :newuser
  end

  post '/newuser' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/welcomenewuser'
  end

  get '/welcomenewuser' do
    @user = User.find(id: session[:user_id])
    erb :welcomenewuser
  end

  post '/welcomenewuser' do
    @user = User.find(id: session[:user_id])
    redirect '/welcomenewuser'
  end

  run! if app_file == $0

end
