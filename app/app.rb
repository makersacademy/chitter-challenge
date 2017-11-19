ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/datamapper_setup'
require_relative 'app_helper'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'key'
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @current_user = current_user
    erb :peeps
  end

  get '/peeps/new' do
    @current_user = current_user
    if @current_user
      erb :new_peep
    else
      redirect '/peeps'
    end
  end

  get "/goto/peeps/new" do
    redirect '/peeps/new'
  end

  post '/peeps/new' do
    peep_msg = params[:peep]
    timestamp = Time.new.strftime("%H:%M:%S %a-%d-%b-%Y")
    new_peep = Peep.new(message: peep_msg, username: current_user.username,
      time: timestamp)
    current_user.peep << new_peep
    current_user.save
    redirect '/peeps'
  end

  get '/users/sign_in' do
    erb :sign_in
  end

  get '/goto/users/sign_in' do
    redirect '/users/sign_in'
  end

  post '/users/sign_in' do
    login_name = params[:username_or_email]
    password = params[:password]
    user = find_user(login_name)
    if user
      if user.password == password
        session[:user_id] = find_user(login_name).id
        redirect '/peeps'
      else
        flash.now[:sign_in_error] = 'Incorrect password'
        erb :sign_in
      end
    else
      flash.now[:sign_in_error] = 'Username or email not found.'
      erb :sign_in
    end
  end

  post '/users/sign_out' do
    session.clear
    redirect('/')
  end

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  get '/goto/users/new' do
    redirect 'users/new'
  end

  post '/users/new' do
    name = params[:name]
    username = params[:username]
    email = params[:email]
    password = params[:password]
    password_check = params[:password_confirmation]
    @user = User.new(
      name: name, username: username, email: email,
      password: password, password_confirmation: password_check)
    if !password.empty? && @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      sign_up_error_message(username, email, password, password_check)
    end
  end

  run if app_file == $0
end
