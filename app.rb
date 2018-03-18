require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/database_connection'
require './lib/user'
require './lib/comment'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash


  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    email = User.exists?('email', params['email'])
    username = User.exists?('username', params['username'])
    if email
      flash[:notice] = 'There is already an account with that email.'
      redirect '/users/new'
    elsif username
      flash[:notice] = 'That username is already taken.'
      redirect '/users/new'
    else
      user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
      session[:id] = user.id
      redirect '/users/feed'
    end
  end

  get '/users/feed' do
    @user = User.find(session[:id])
    erb :"users/feed"
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:id] = user.id
      redirect('/users/feed')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'Thank you for using Chitter, come back soon!'
    redirect('/')
  end

  post '/users/:id/comments' do
    time = Time.now.getutc
    comment = Comment.create(link_id: params['id'], text: params['text'], time: time)
    redirect('/users/feed')
  end

end
