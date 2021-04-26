require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './database_connection_setup'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peeps.all
    erb :"peeps/index"
  end

  post '/peeps' do
    Peeps.create(content: params[:peep])
    redirect '/peeps'
  end

  get '/users' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions' do
    erb :"sessions/index"
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username],email: params[:email], password: [:password])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect '/peeps'
  end

  run! if app_file == $0

end
