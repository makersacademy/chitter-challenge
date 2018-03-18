require_relative './lib/peep'
require_relative './lib/user'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/mail.rb'

class Chitter < Sinatra::Base
  # attr_reader :MSGS

  MSGS = {
    signup_err: 'Error signing up, username taken or email already registered.',
    signup_succ: 'Sign up successful, please sign in.',
    invd_cred: 'Invalid username or password',
    acct_del_succ: 'Account deleted.',
    acct_del_err: 'Account deletion unsuccessful! Invalid username or password'
  }

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:login)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    signed_up = User.add(params[:txt_username], params[:txt_pwd],
      params[:txt_first_name], params[:txt_last_name], params[:txt_email])
    if !signed_up
      flash[:error] = MSGS[:signup_err]
      redirect('/signup')
    else
      flash[:success] = MSGS[:signup_succ]
      redirect('/')
    end
  end

  post '/login' do
    userid = User.login(params[:txt_username], params[:txt_pwd])
    if userid > 0
      session[:user] = params[:txt_username]
      session[:user_id] = userid
      redirect('/peeps')
    end
    flash[:error] = MSGS[:invd_cred] # 'Invalid username or password'
    redirect('/')
  end

  get '/logout' do
    session.clear
    redirect('/')
  end

  get '/peeps' do
    @active_user = !session[:user_id].nil? ? 'visible' : 'hidden'
    @no_active_user = session[:user_id].nil? ? 'visible' : 'hidden'
    @username = session[:user]
    @peeps = Peep.show_all
    erb(:index)
  end

  post '/add' do
    Peep.add(session[:user_id], params[:tb_peep]) # TODO: get actual id after log in
    redirect('/peeps')
  end

  get '/delete' do
    erb(:delete)
  end

  post '/delete' do
    deleted = User.delete(session[:user_id], params[:txt_username], params[:txt_pwd])
    if deleted
      flash[:success] = MSGS[:acct_del_succ]
      session.clear
      redirect('/')
    else
    flash[:error] = MSGS[:acct_del_err]
    redirect('/delete')
    end
  end

  run! if app_file == $0
end
