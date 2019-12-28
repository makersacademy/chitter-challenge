require 'sinatra/base'
require 'sinatra/flash'
require './public/lib/message.rb'
require './public/lib/account.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  before do
    @logged_in = session[:logged_in?]
    @logged_out = session[:logged_out?]
  end

  get '/' do
    @current_user = session[:username]
    @peep = Message.all
    Message.all[0]
    flash[:notice]
    erb :index, { :layout => :layout } 
  end

  post '/' do
    if @logged_in != true
      flash[:notice] = 'Need to sign up or log in to post a message.'
    else
      Account.instance.username
      @username = Account.instance.username
      Message.add(@username, params[:message])
      @user_tagged = Message.tag(params[:message])
      if Message.tag(params[:message]) != nil
        Message.email(params[:message], @username, @user_tagged) 
      end
    end
    redirect '/'
  end

  delete '/message/:id' do
    Message.delete(params[:id])
    redirect '/'
  end

  get '/message/:id/edit' do
    @id = params[:id]
    @message = Message.get_message(params[:id])
    erb :edit
  end

  patch '/message/:id' do
    Message.edit(params[:id], params[:message])
    redirect '/'
  end

  get '/account' do
    flash[:notice]
    erb :account
  end

  post '/account' do
    if Account.email_exists?(params[:email])  == true
      flash[:notice] = 'Email already in use!'
      redirect '/account'
    else
      Account.create(params[:username], params[:email], params[:password])
      redirect '/confirmation'
    end
  end

  get '/confirmation' do
    @account = Account.new_account
    erb :confirmation 
  end

  get '/log_in' do
    flash[:notice]
    erb :log_in
  end

  post '/log_in' do
    if 
      Account.username_exists?(params[:username]) != true
      flash[:notice] = 'Username does not exist.'
      redirect '/log_in'
    elsif
      Account.log_in(params[:username], params[:password]) != true
      flash[:notice] = 'Wrong password entered, try again.'
      redirect '/log_in'
    else  
      session[:username] = params[:username] 
      session[:logged_in?] = Account.log_in(params[:username], params[:password])
      redirect '/'
    end
  end

  get '/account/log_out' do
    session[:logged_in?] = nil
    redirect '/'
  end

  run! if app_file == $0
end
