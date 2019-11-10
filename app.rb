require 'sinatra'
require './lib/account'


class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get '/create_account' do
    erb :create_account
  end

  post '/create_account_post' do
    session[:user] = Account.create_account(email:params['email'],password:params['password'],name:params['name'])
    redirect '/profile'
  end

  post '/login_post' do
    session[:user] = Account.account_identifier(email:params['email'],password:params['password'])
    redirect '/profile'
  end

  get '/profile' do
    @user = session[:user]
    erb :profile
  end

  post '/chit_post' do
    redirect '/newsfeed'
  end

  get '/newsfeed' do
    erb :newsfeed
  end








run! if app_file == $0

end
