# RESTful routes
# GET /peeps
# GET /peeps/:id
# GET /peeps/new
# GET /peeps/update
# POST /peeps
# POST /peeps/:id/update
# POST /peeps/:id/delete

require 'uri'
require 'sinatra'
require 'sinatra/flash'
require './lib/user'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  disable :strict_paths

  register Sinatra::Flash

  get '/' do
    'Chitter'
  end

  get '/chitter' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'chitter/index'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/chitter'
  end

  post '/chitter' do
    Peep.create(text: params[:text])
    redirect('/chitter')
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/chitter')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/chitter')
  end

  run! if app_file == $0
end
