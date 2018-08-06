require 'sinatra/base'
require 'sinatra/flash'
require './lib/user_posts'
require './lib/New_user'
require './database_connection_setup'


class Chitter < Sinatra::Base
  enable 'sessions'

  get '/' do
    erb(:index)
  end

  get '/user' do
    @user = New_user.find(session[:user_id])
    @all_posts = User.all
    erb(:user)
  end

  post '/user' do
    User.create(content: params['new_post'])
    redirect '/user'
  end

  get '/user/new' do
    erb(:new_user)
  end

  post '/users' do
    New_user.create(username: params['username'], email: params['email'], password: params['password'])
    redirect '/user' # think about this...
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = New_user.authenticate(params['username'], params['password'])
    user = New_user.find(session[:user_id])
    redirect('/user') # think about this too

    if user
       session[:user_id] = user.id
       redirect('/user')
     else
       flash[:notice] = 'Please check your email or password.'
       redirect('/sessions/new')
     end
  end

  post '/sessions/destroy' do
    session.clear
    "You have signed out"
    redirect '/'
  end

  run! if app_file == $0
end
