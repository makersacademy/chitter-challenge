require 'sinatra/base'
require 'sinatra/flash'
require './lib/message.rb'
require './lib/user.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :welcome_page
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(fullname: params[:fullname], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/chitter/new'
  end

  get '/chitter_feed' do
    @peeps = Message.all
    erb :chitter_feed
  end

  get '/chitter/new' do
    @user = User.find(id: session[:user_id])
    erb :'/chitter/new'
  end

  post '/chitter/new' do
    @peep = Message.post(message: params[:message])
    redirect '/chitter_feed'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/chitter/new')
    else
      flash[:notice] = 'Please check your email or password.'
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
