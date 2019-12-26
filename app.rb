require 'sinatra/base'
require './lib/message.rb'
require './lib/account.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  before do
    @logged_in = session[:logged_in?]
    @logged_out = session[:logged_out?]
  end

  get '/' do
    @current_user = session[:username]
    @peep = Message.all
    Message.all[0]
    erb :index, { :layout => :layout } 
  end

  get '/new_message' do
    erb :new_message
  end

  post '/new_message' do
    Account.instance.username
    @username = Account.instance.username
    @params[:message]
    Message.add(@username, params[:message])
    redirect '/'
  end

  delete '/message/:id' do
    Message.delete(params[:id])
    redirect '/'
  end

  get '/message/:id/edit' do
    @id = params[:id]
    @message = Message.get_message(params[:id])
    erb :edit, { :layout => :layout }
  end

  patch '/message/:id' do
    Message.edit(params[:id], params[:message])
    redirect '/'
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
    erb :confirmation, { :layout => :layout } 
  end

  get '/log_in' do
    erb :log_in, { :layout => :layout }
  end

  post '/log_in' do
    session[:username] = params[:username]
    session[:logged_in?] = Account.log_in(params[:username], params[:password])
    redirect '/'
  end

  get '/account/log_out' do
    session[:logged_in?] = nil
    redirect '/'
  end

  run! if app_file == $0
end
