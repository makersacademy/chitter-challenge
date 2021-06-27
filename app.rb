require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Peeps'
  end

  get '/peeps' do
    @user = User.find(user_id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep_text: params[:message])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    flash[:notice_1] = "That username is already taken." if user == false
    flash[:notice_2] = "An account with that email already exists." if user.nil?
    session[:user_id] = user.user_id if user
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.user_id
    redirect('/peeps')
  end

  run! if app_file == $0
end
