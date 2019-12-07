require 'sinatra/base'
require './lib/message.rb'
require './lib/account.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @logged_in = session[:logged_in?]
    @logged_out = session[:logged_out?]
    erb :index
  end

  get '/chitter_feed' do
    @peep = Message.all
    erb :chitter_feed
  end

  get '/new_message' do
    erb :new_message
  end

  post '/new_message' do
    @username = Account.instance.username
    Message.add(@username, params[:message])
    redirect '/chitter_feed'
  end

  get '/account' do
    @exists = session[:exists]
    erb :account
  end

  post '/account' do
    session[:exists] = Account.exists?(params[:email]) 
    if session[:exists] == true
      redirect '/account'
    else
      Account.create(params[:username], params[:email], params[:password])
      redirect '/account/confirmation'
    end
  end

  get '/account/confirmation' do
    @account = Account.new_account
    erb :confirmation
  end

  get '/account/log_in' do
    erb :"/account/log_in"
  end

  post '/account/log_in' do
    session[:logged_in?] = Account.log_in(params[:username], params[:password])
    redirect '/'
  end

  get '/account/log_out' do
    session[:logged_in?] = nil
    redirect '/'
  end

  run! if app_file == $0
end
