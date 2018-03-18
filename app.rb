require_relative './lib/peep'
require_relative './lib/user'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/mail.rb'

class Chitter < Sinatra::Base
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
      flash[:error] = 'Error signing up, username taken or email already registered.'
      redirect('/signup')
    else
      flash[:success] = 'Sign up successful, please sign in.'
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
    flash[:error] = 'Invalid username or password'
    redirect('/')
  end

  get '/peeps' do
    @pb_visiblity = session[:user_id].nil? ? 'hidden' : 'visible'
    @username = session[:user]
    @peeps = Peep.show_all
    erb(:index)
  end

  post '/add' do
    Peep.add(session[:user_id], params[:tb_peep]) # TODO: get actual id after log in
    redirect('/peeps')
  end
  run! if app_file == $0
end

# TODO: delete user's tweets if user is deleted
# TODO: add a nav bar with options to log in, out and delete account
# TODO: RESTful
# TODO: tag users
# TODO: email when tagged or sign up
