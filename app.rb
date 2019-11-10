require 'sinatra'
require './lib/account'
require './lib/message'

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
    Message.new_message(sender:session[:user].name, content:params[:chit])
    redirect '/newsfeed'
  end

  get '/newsfeed' do
    @chits = Message.sort(Message.all)
    erb :newsfeed
  end

  post '/log_out' do
    session[:user] = nil
    redirect '/'
  end








run! if app_file == $0

end
