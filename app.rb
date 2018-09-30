require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require './lib/models'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.get(session[:user_id])
    @messages = Message.all(:order => [:id.desc])
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      name: params['name'],
      username: params['username'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.create(text: params['post'], user_id: session[:user_id])
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.first(:email => params['email'], :password => params['password'])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Your email or your password is incorrect.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
